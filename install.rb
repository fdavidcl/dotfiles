#!/usr/bin/env ruby
require 'find'
require 'fileutils'

blacklist = [".git", "README.md", "LICENSE", "install.rb", "save.rb"]
dotfiles = Find.find('.').select { |e| !File.directory?(e) && !blacklist.include?(e) }

dotfiles.each do |fl|
  dest = "~/#{fl}"
  puts "#{fl} → #{dest}"
  FileUtils.cp(fl, dest)
end
