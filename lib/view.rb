require 'terminal-basic-menu'
require_relative('./constants')
require 'terminal-table'
require_relative './nokogiri'

class View
  def menu(gem)
    display_menu menu_config gem
  end

  def table(results)
    display_table formatted results
  end

  private

  # configurations for Menu
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

  def display_menu(config)
    menu = Menu.new(config)
    menu.border_color = :green
    menu.display_menu
  end

  # Configurations for table
  def formatted(results)
    results.map(&:values_array)
  end

  def display_table(rows)
    table = Terminal::Table.new rows: rows
    puts table
  end
end