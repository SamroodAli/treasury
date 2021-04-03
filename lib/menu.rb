require 'terminal-basic-menu'
require_relative('./system')
require_relative('./CONSTANTS.rb')

def display_menu(gem)
  
  menu1 = Menu.new(header: header, body: body, footer: footer)
  menu1.border_color = :green
  menu1.display_menu
  system_interface(header_text)
end

def header_config(gem)
  header_text = gem[0]
  header = { text: header_text, color: :red }
  header
end

def body_config(gem)
  body_text = gem[1]
  body_choices = MENU
  body = { text: body_text, choices: body_choices, align: 'center', color: :white }
  body
end

def footer_config(gem)
  footer_text = 'Press q to quit, s to search again'
  footer = { text: footer_text, align: 'center', color: :blue }
  footer
end
