require_relative('./../lib/nokogiri')
require_relative('./../lib/menu')
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

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
display_results(user_search)
