def say(msg)
  puts "=> #{msg}"
end

def exit_with(msg)
  say msg
  exit
end

names = File.open('names.txt', 'r') do |f|
  f.read
end.split

nouns = File.open('nouns.txt', 'r') do |f|
  f.read
end.split

adjectives = File.open('adjectives.txt', 'r') do |f|
  f.read
end.split

verbs = File.open('verbs.txt', 'r') do |f|
  f.read
end.split


exit_with("No input file!") if ARGV.empty?
exit_with("File doesn't exist!") if !File.exists?(ARGV[0])

content = File.open(ARGV[0], 'r') do |file|
  file.read
end

content.gsub!("NAME", names.sample) 

content.gsub!("NOUN").each do |noun|
  nouns.sample
end

content.gsub!("ADJECTIVE").each do |adjective|
  adjectives.sample
end

content.gsub!("VERB").each do |verb|
  verbs.sample
end

p content