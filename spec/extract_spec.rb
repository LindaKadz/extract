require 'spec_helper'

RSpec.describe 'Extract' do
  let(:file) { 'app.rb' }
  let(:directories) { %w(gps_images lib) }
  let(:sub_directory) { 'cats' }

  before :each do
    @my_output1 = cd('lib') { Dir.getwd }
    @my_output2 = cd('gps_images') { Dir.getwd }
    create_directory(File.join(directories.first, sub_directory))
  end

 context 'create files and directories' do
   it { expect(@my_output1).to include 'lib' }
   it { expect(@my_output2).to include 'gps_images' }
   it { expect(file).to be_an_existing_file }
   it { expect(directories).to include a_directory_having_sub_directory sub_directory }
 end
end
