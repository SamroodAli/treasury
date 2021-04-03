require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')


def user_input
  gets.chomp
end

def user_num
  gets.chomp.to_i
end

model =Model.new

puts 'hello, what dependency are you looking for ?'
results = model.query_results(user_input)
view = View.new
view.table results
puts 'enter a gem index'
gem = results[user_num].menu_array
view.menu gem
SystemAPI.new gem[0], user_input

