require 'terminal-basic-menu'
require_relative('./system')

def display_menu(gem)
  header_text = gem[0]
  header = { text: header_text, color: :red }
  body_text = gem[1]
  body_choices =
    [
      'Install this Gem',
      'Uninstall this Gem',
      'Have gem in current project',
      'Read ri documentation if available',
      'go to this Gem website'
    ]
  body = { text: body_text, choices: body_choices, align: 'center', color: :white }
  footer_text = 'Press q to quit, s to search again'
  footer = { text: footer_text, align: 'center', color: :blue }
  menu1 = Menu.new(header: header, body: body, footer: footer)
  menu1.border_color = :green
  menu1.display_menu
  display_menu(gem) unless system_interface(header_text)
end
