require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')

def user_input
  gets.chomp
end

def user_num
  gets.chomp.to_i
end

next_turn = true
while next_turn
  next_turn = false
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
    case user
    when 'q'
      valid = true
      break
    when 's'
      valid = true
      next_turn = true
    when 't'
      view.table model.gems
      gem_no = user_num
      user_num until gem_no.between?(0...30)
    when 'l'
      model.next_gem
    when 'h'
      model.previous_gem
    when user.to_i.between?(1, 4)
      SystemAPI.new model.current_gem.name, user
    else
      puts 'please enter a valid option'
    end
    system('clear')
    view.menu model.current_gem
  end
end
