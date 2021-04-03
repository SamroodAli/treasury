require 'terminal-table'
require_relative './nokogiri.rb'

def display_results(rows)
  rows = rows.map(&:values_array)
  new_table rows
end

def new_table(rows)
    table = Terminal::Table.new rows: rows
    puts table
end
