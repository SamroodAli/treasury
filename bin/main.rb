require_relative('../lib/nokogiri.rb')
require_relative('./../lib/table')
require_relative('../lib/system')
require_relative('../lib/menu')

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
rows = query_results(user_search)
gem = display_results(rows)

GemMenu.new(gem)
user_input = gets.chomp
SystemAPI.new gem[0], user_input
