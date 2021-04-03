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
      ri_documentation(gem)
    when '4'
      launch_website(gem)
    end
  end

  def install_gem(gem)
    puts "please wait while installing #{gem}"
    system("gem install #{gem}")
  end

  def uninstall_gem(gem)
    puts "please wait while uninstalling #{gem}"
    system("gem uninstall #{gem}")
  end

  def ri_documentation(gem)
    puts "please wait while loading documentation for #{gem}"
    system("ri #{gem}")
  end

  def launch_website(gem)
    puts "please wait while launching #{gem} online documentation"
    puts 'press CONTROL and C together to exit session'
    uri = RUBY_WEBSITE + gem

    Launchy.open(uri) do |exception|
      puts "Attempted to open #{uri} and failed because #{exception}"
      system('exit')
    end
  end
end
