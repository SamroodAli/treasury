require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')

def user_input
  gets.chomp
end

def user_num
  gets.chomp.to_i
end

def start
  puts 'hello, what dependency are you looking for ?'
  model = Model.new user_input
  view = View.new
  view.table model.gems
  puts 'enter a gem index'
  gem = model.gems[user_num]
  puts gem
  view.menu gem
  valid = false
  until valid do
    user = user_input
    if user == 'q'
      valid = true
    elsif user == 's'
      valid = true
      start
    elsif user.to_i.between?(1,4)
      SystemAPI.new gem.name, user
      view.menu gem
    else
      puts 'please enter a valid option'
      view.menu gem
    end
  end
end

start
