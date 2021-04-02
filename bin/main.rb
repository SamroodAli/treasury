require_relative('./../lib/nokogiri')
require "terminal-table"
require "terminal-basic-menu"

rows = query_results('terminal').map{ |query_items| query_items.values_array}
# 
header_text = 'app'
header = {text:header_text,color: :red}
body_text = 'here is gping tp dems sdeded'
body_choices = ['Install gem','View documentation','go to gem website']
body = {text:body_text,choices:body_choices,align:"center",color: :white}
footer_text = "Press q to quit, s to search again"
footer = {text:footer_text,align:"center",color: :blue}
menu1= Menu.new(header:header, body:body, footer:footer)
menu1.border_color = :green
system('clear')
menu1.display_menu


# table = Terminal::Table.new :rows => rows
# puts table
