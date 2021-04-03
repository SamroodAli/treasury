require 'launchy'

def system_interface(header_text)
  user_input = gets.chomp
  gem_interface(header_text, user_input) if user_input.is_a?(Integer)
end

def gem_interface(header_text, user_input)
  gem = header_text
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

  end
  true
end

def install_gem(gem)
  system("gem install #{gem}")
end

def uninstall_gem(gem)
  system("gem uninstall #{gem}")
end


def launch_website(gem) do
    uri = "https://rubygems.org/gems/#{gem}"
    
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
