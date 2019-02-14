#!/usr/bin/env ruby

require 'exif'
require 'csv'
require 'optparse'

@options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Got lost? Here are the guides:\n"

  opts.on("-a", "--all", "To extract all the EXIF gps details all directories") do
    @options[:all] = true
    begin
    Dir.glob("../gps_images/**/*.jpg").each do |file|

      longitude = Exif::Data.new(IO.read(file)).gps_longitude
      latitude = Exif::Data.new(IO.read(file)).gps_latitude

      puts "Here is the gps details,\n logitude: #{longitude}, \n latitude: #{latitude}"
    end
    rescue Exif::NotReadable
     puts 'No data to be read'
    end
  end

  opts.on("-pr", "--print", "To extract all the EXIF gps details in a directory and sub directories and print to a csv file") do
    @options[:print] = true
    CSV.open("results.csv", "wb") do |row|
      begin
      Dir.glob("../gps_images/**/*.jpg").each do |file|
        longitude = Exif::Data.new(IO.read(file)).gps_longitude
        latitude = Exif::Data.new(IO.read(file)).gps_latitude
        row << [file, longitude, latitude]
      end
     rescue Exif::NotReadable
      puts 'No data to be read'
     end
    end

    CSV.foreach("results.csv") do |row|
      puts row
    end
  end
end

  begin
    parser.parse!
  rescue OptionParser::InvalidOption
    puts 'Wrong arguments! Write ruby app.rb -h to see our guides.'
  end

if @options != {}
  p @options
else
  begin
  Dir.glob("../gps_images/*.jpg").each do |file|

    longitude = Exif::Data.new(IO.read(file)).gps_longitude
    latitude = Exif::Data.new(IO.read(file)).gps_latitude

    puts "Here is the gps details,\n logitude: #{longitude}, \n latitude: #{latitude}"
  end
  rescue Exif::NotReadable
    puts 'No data to be read'
  end
end
