require 'launchy'

def system_interface(header_text)
  user_input = gets.chomp
  if user_input.is_a?(Integer)
    gem_interface(header_text,user_input)
  end
end

def gem_interface(header_text,user_input)
  gem = header_text
  case user_input
  when '1'
    install_gem(gem)
  when '2'
    system("gem uninstall #{header_text}")
  when '3'
    system("gem install #{header_text}")
    open('Gemfile', 'a') do |file|
      file << "gem '#{header_text}'"
    end
  when '4'
    system("ri #{header_text}")
  when '5'
    uri = "https://rubygems.org/gems/#{header_text}"
    Launchy.open(uri) do |exception|
      puts "Attempted to open #{uri} and failed because #{exception}"
      system('exit')
    end
  end
  true
end


def install_gem(gem)
  system("gem install #{gem}")
end

def uninstall_gem(gem)
  system("gem uninstall #{gem}")
end
