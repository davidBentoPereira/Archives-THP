path_to_file = '/home/bento/www/thp/fullstack/week2/day5/automate_project/Gemfile'
file = File.open(path_to_file, 'a')

file.puts("gem 'pry'")
file.close

file = File.open(path_to_file, 'r')
puts file.read
file.close