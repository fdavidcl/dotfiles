#!/usr/bin/env ruby
require 'find'
require 'fileutils'

blacklist = [".git", "README.md", "LICENSE", "install.rb", "save.rb"]
dotfiles = Find.find('.').select do |e| 
  !File.directory?(e) && (blacklist.index { |f| e.start_with?(f) }.nil?)
end

dotfiles.each do |fl|
  dest = "~/#{fl}"
  begin
    FileUtils.install(dest, fl)
  	puts "#{fl} ← #{dest}"
  rescue StandardError => e
    puts "\e[31m#{fl} ← #{dest}\e[m"
  end
end

system "git add ."
system %(git commit -m "Update #{Time.new}")
system "git push"
