require 'launchy'
require_relative('./constants')

def system_interface(header_text)
  user_input = gets.chomp
  gem_interface(header_text, user_input)
end

def gem_interface(gem, user_input)
  case user_input
  when '1'
    install_gem(gem)
  when '2'
    uninstall_gem(gem)
  when '3'
    install_gem(gem)
  when '4'
    system("ri #{header_text}")
  when '5'
    launch_website(gem)
  end
end

def install_gem(gem)
  puts gem
  system("gem install #{gem}")
end

def uninstall_gem(gem)
  system("gem uninstall #{gem}")
end

def launch_website(gem)
  uri = RUBY_WEBSITE + gem

  Launchy.open(uri) do |exception|
    puts "Attempted to open #{uri} and failed because #{exception}"
    system('exit')
  end
end

# def append_file(gem, file_name = 'Gemfile')
#   open(file_name, 'a') do |file|
#     file << "gem '#{gem}'"
#   end
# end
