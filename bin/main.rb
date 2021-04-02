require_relative('./../lib/nokogiri')
require "terminal-table"


rows = query_results('terminal').map{ |query_items| query_items.values_array}

table = Terminal::Table.new :rows => rows
puts table
