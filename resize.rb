#!/usr/bin/env ruby

require 'rubygems'
require 'RMagick' 
require 'pathname'
require 'fileutils' 

drawable_path = "#{Dir.pwd}/drawable-"

FileUtils::mkdir_p "#{drawable_path}sw720dp/"
FileUtils::mkdir_p "#{drawable_path}sw600dp/"
FileUtils::mkdir_p "#{drawable_path}xxhdpi/"
FileUtils::mkdir_p "#{drawable_path}xhdpi/"
FileUtils::mkdir_p "#{drawable_path}hdpi/"
FileUtils::mkdir_p "#{drawable_path}mdpi/"

Dir.glob("#{drawable_path}xxhdpi/*.png") do |fname|  
  img = Magick::Image::read(fname)[0]
  img_drawablesw720 = img.scale(0.53)
  img_drawablesw600 = img.scale(0.52)
  img_xhdpi = img.scale(0.66)
  img_hdpi = img.scale(0.47)
  img_mdpi = img.scale(0.33)

  filename =  Pathname.new(fname).basename
  img_drawablesw720.write("#{drawable_path}sw720dp/#{filename}")
  img_drawablesw600.write("#{drawable_path}sw600dp/#{filename}")
  img_xhdpi.write("#{drawable_path}xhdpi/#{filename}") 
  img_hdpi.write("#{drawable_path}hdpi/#{filename}")
  img_mdpi.write("#{drawable_path}mdpi/#{filename}")
end   