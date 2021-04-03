require 'terminal-table'

def display_results(search)
  rows = query_results(search).map(&:values_array)
  table = Terminal::Table.new rows: rows
  puts table
  puts 'enter a gem index'
  user_input = gets.chomp.to_i
  rows = query_results(search).map(&:menu_array)
  rows[user_input]
end
