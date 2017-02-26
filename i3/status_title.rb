#!/usr/bin/env ruby
# coding: utf-8

3.times { puts readline }

loop do
  line = readline
  id = `xprop -root`
  id = id[(id.index("_NET_ACTIVE_WINDOW(WINDOW):") + 40) ... id.length].split[0]
  
  name = `xprop -id #{id} | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2-`.strip

  print %(,[{"name":"window_title","markup":"none","full_text": " #{name[0 ... name.length - 1]}"},#{line[2 ... line.length]})
end
