require 'spec_helper'
require 'exif'

RSpec.describe 'Extract' do
  let(:file) { 'app.rb' }
  let(:directories) { %w(gps_images lib) }
  let(:sub_directory) { 'cats' }
  # let(:image) { Exif::Data.new(IO.read("../gps_images/image_a.jpg")).gps_longitude }

  before :each do
    @my_output1 = cd('lib') { Dir.getwd }
    @my_output2 = cd('gps_images') { Dir.getwd }
    create_directory(File.join(directories.first, sub_directory))
  end

 context 'create files and directories' do
   it { expect(@my_output1).to include 'lib' }
   it { expect(@my_output2).to include 'gps_images' }
   it { expect(file).to be_an_existing_file }
   # it { expect(image).to include '[102]' }
   it { expect(directories).to include a_directory_having_sub_directory sub_directory }
 end
end
