def check_if_user_gave_input
  abort('mkdir: missing input') if ARGV.empty?
end

def get_folder_name
  folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

def perform
  check_if_user_gave_input
  create_folder(get_folder_name)
end

perform