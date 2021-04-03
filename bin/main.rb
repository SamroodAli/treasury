require_relative('../lib/nokogiri')
require_relative('../lib/system')
require_relative('../lib/menu')

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
results = query_results(user_search)
view = View.new
view.table results
puts 'enter a gem index'
user_input = gets.chomp.to_i
gem = results[user_input].menu_array

view.menu gem
user_input = gets.chomp
SystemAPI.new gem[0], user_input
