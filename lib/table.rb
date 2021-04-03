require 'terminal-table'
require './nokogiri.rb'

def display_results(search)
  rows = query_results(search).map(&:values_array)
  new_table rows
  puts table
  puts 'enter a gem index'
  user_input = gets.chomp.to_i
  rows = query_results(search).map(&:menu_array)
  rows[user_input]
end

def new_table(rows)
    table = Terminal::Table.new rows: rows
end
