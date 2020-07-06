path_to_file = '/home/bento/www/thp/fullstack/week2/day5/automate_project/'
file = 'hello_world.txt'
file = File.open(path_to_file + file, 'r')

puts file.read