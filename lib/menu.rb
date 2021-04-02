def display_menu(gem)
  header_text = gem[0]
  header = { text: header_text, color: :red }
  body_text = gem[1]
  body_choices = ['Install this Gem', 'Uninstall this Gem', 'Have gem in current project',
                  'Read ri documentation if available', 'go to this Gem website']
  body = { text: body_text, choices: body_choices, align: 'center', color: :white }
  footer_text = 'Press q to quit, s to search again'
  footer = { text: footer_text, align: 'center', color: :blue }
  menu1 = Menu.new(header: header, body: body, footer: footer)
  menu1.border_color = :green
  menu1.display_menu
  system_interface
end

def system_interface
  user_input = gets.chomp
  case user_input
  when '1'
    system("gem install #{header_text}")
  when '2'
    system("gem uninstall #{header_text}")
  when '3'
    system("gem install #{header_text}")
    open('Gemfile', 'a') do |file|
      file << "gem '#{header_text}'"
    end
  when '4'
    system("ri #{header_text}")
  else
    uri = "https://rubygems.org/gems/#{header_text}"
    Launchy.open(uri) do |exception|
      puts "Attempted to open #{uri} and failed because #{exception}"
      system('exit')
    end
  end
  return user_input
end
