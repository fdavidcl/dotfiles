#!/usr/bin/env ruby
require 'find'
require 'fileutils'

blacklist = [".git", "README.md", "LICENSE", "install.rb", "save.rb"]
dotfiles = Find.find('.').select { |e| !File.directory?(e) && !blacklist.include?(e) }

dotfiles.each do |fl|
  dest = "~/#{fl}"
  puts "#{fl} ← #{dest}"
  begin
  FileUtils.cp(dest, fl)
  rescue StandardError => e
  end
end

system "git add ."
system %(git commit -m "Update #{Time.new}")
system "git push"
