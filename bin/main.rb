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
  system('clear')
  puts 'hello, what dependency are you looking for ?'
  model = Model.new user_input
  view = View.new
  view.table model.gems
  puts 'enter a gem index'
  gem = model.gems[user_num]
  system('clear')
  view.menu gem
  valid = false
  until valid
    user = user_input
    if user == 'q'
      valid = true
    elsif user == 's'
      valid = true
      start
    elsif user.to_i.between?(1, 4)
      SystemAPI.new gem.name, user
      view.menu gem
    else
      system('clear')
      puts 'please enter a valid option'
      view.menu gem
    end
  end
end

start
