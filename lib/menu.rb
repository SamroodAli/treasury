require 'terminal-basic-menu'
require_relative('./system')
require_relative('./constants')

def display_menu(gem)
  gem_menu(gem)
  system_interface(gem[0])
end

def header_config(gem)
  header_text = gem[0]
  { text: header_text, color: :red }
end

def body_config(gem)
  body_text = gem[1]
  body_choices = MENU
  { text: body_text, choices: body_choices, align: 'center', color: :white }
end

def footer_config
  footer_text = MENU_FOOTER_OPTIONS
  { text: footer_text, align: 'center', color: :blue }
end

def menu_config(gem)
  header = header_config(gem)
  body = body_config(gem)
  footer = footer_config
  { header: header, body: body, footer: footer }
end

def gem_menu(gem)
  config = menu_config(gem)
  menu = Menu.new(config)
  menu.border_color = :green
  menu.display_menu
end
