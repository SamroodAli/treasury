require_relative('../lib/nokogiri.rb')
require_relative('../lib/system')
require_relative('../lib/menu')

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
rows = query_results(user_search)
view = GemMenu.new
view.display_results rows
  puts 'enter a gem index'
  user_input = gets.chomp.to_i
  rows = rows.map(&:menu_array)
gem=  rows[user_input]

view.display_menu gem
user_input = gets.chomp
SystemAPI.new gem[0], user_input
