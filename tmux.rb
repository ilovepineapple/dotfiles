#! /usr/bin/env ruby

session_name = ARGV[0]

if session_name.nil? || session_name.empty?
  puts "Please provide a session name as an argument"
  exit
end

system("tmux new -s #{session_name}")
