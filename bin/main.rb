require_relative('./../lib/nokogiri')
require "terminal-table"
require "terminal-basic-menu"

rows = query_results('terminal').map{ |query_items| query_items.values_array}

query_item = rows[0]

table = Terminal::Table.new :rows => rows
puts table
