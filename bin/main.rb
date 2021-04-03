require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')

def user_input
  gets.chomp
end

def user_num
  gets.chomp.to_i
end

puts 'hello, what dependency are you looking for ?'
model = Model.new user_input
view = View.new
view.table model.gems
puts 'enter a gem index'
gem = model.gems(user_num)
view.menu gem
SystemAPI.new gem[0], user_input
