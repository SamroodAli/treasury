require_relative('./../lib/nokogiri')
require_relative('./../lib/table')

puts 'hello, what dependency are you looking for ?'
user_search = gets.chomp
display_results(user_search)
