require 'launchy'
require_relative('./constants')

class SystemAPI
  
  def initialize(gem, user_input)
    gem_interface gem, user_input
  end

  private

  def gem_interface(gem, user_input)
    case user_input
    when '1'
      install_gem(gem)
    when '2'
      uninstall_gem(gem)
    when '3'
      ri_documentation
    when '4'
      launch_website(gem)
    end
  end

  def install_gem(gem)
    system("gem install #{gem}")
  end

  def uninstall_gem(gem)
    system("gem uninstall #{gem}")
  end

  def ri_documentation
    system("ri #{header_text}")
  end

  def launch_website(gem)
    uri = RUBY_WEBSITE + gem

    Launchy.open(uri) do |exception|
      puts "Attempted to open #{uri} and failed because #{exception}"
      system('exit')
    end
  end
end

# def append_file(gem, file_name = 'Gemfile')
#   open(file_name, 'a') do |file|
#     file << "gem '#{gem}'"
#   end
# end
