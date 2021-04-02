require_relative('./../lib/nokogiri')
require 'terminal-table'
require 'terminal-basic-menu'
require 'launchy'

def display_results(search)
  rows = query_results(search).map(&:values_array)
  table = Terminal::Table.new rows: rows
  puts table
  puts 'enter a gem index'
  user_input = gets.chomp.to_i
  rows = query_results(search).map(&:menu_array)
  gem = rows[user_input]
  display_menu(gem)
end

def display_menu(gem)
  header_text = gem[0]
  header = { text: header_text, color: :red }
  body_text = gem[1]
  body_choices = ['Install this Gem', 'View documentation', 'go to this Gem website']
  body = { text: body_text, choices: body_choices, align: 'center', color: :white }
  footer_text = 'Press q to quit, s to search again'
  footer = { text: footer_text, align: 'center', color: :blue }
  menu1 = Menu.new(header: header, body: body, footer: footer)
  menu1.border_color = :green
  menu1.display_menu
  user_input = gets.chomp
  case user_input
  when '1'
    system("gem install #{header_text}")
  when '2'
    system("ri #{header_text}")
  else
    uri = "https://rubygems.org/gems/#{header_text}"
    Launchy.open(uri) do |exception|
      puts "Attempted to open #{uri} and failed because #{exception}"
      system('exit')
    end
  end
end

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
display_results(user_search)
