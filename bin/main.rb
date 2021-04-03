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
  model.gem(user_num)
  system('clear')
  view.menu model.current_gem
  valid = false
  until valid
    user = user_input
    if user == 'q'
      valid = true
      break
    elsif user == 's'
      valid = true
      start
    elsif user == 'l'
      model.next_gem
    elsif user == 't'
      view.table model.gems
      model.gem(user_num)
    elsif user == 'h'
      model.previous_gem
    elsif user.to_i.between?(1, 4)
      SystemAPI.new model.current_gem.name, user
    else
      puts 'please enter a valid option'
    end
    system('clear')
    view.menu model.current_gem
  end
end

start
