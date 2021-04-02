require_relative('./../lib/nokogiri')
require "terminal-table"
require "terminal-basic-menu"

rows = query_results('terminal').map{ |query_items| query_items.values_array}

gem = rows[0]
header_text = gem.name
header = {text:header_text,color:red}
body_text = gem.description

table = Terminal::Table.new :rows => rows
puts table
