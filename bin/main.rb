require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')

def user_input
  gets.chomp
end

def user_validation
  valid = false
  until valid
    valid = true
    puts 'Enter an index to select a gem'
    puts 'Enter q to quit'
    puts 'Enter s to search again'
    puts 'Enter anything else to select first gem'
    gem_num = user_input
    case gem_num
    when 'q'
      abort
    when 's'
      return 's'
    end
    return gem_num.to_i if gem_num.to_i.between?(0, 30)
    valid = false
  end
end

next_turn = true
while next_turn
  next_turn = false
  system('clear')
  puts 'hello, what dependency are you looking for ?'
  model = Model.new user_input
  view = View.new
  view.table model.gems
  user_num = user_validation
  if user_num == 's'
    next_turn = true
    next
  end
  model.gem(user_num)
  system('clear')
  view.menu model.current_gem
  valid = false
  until valid
    user = user_input
    puts user
    case user
    when 'q'
      valid = true
      break
    when 's'
      valid = true
      next_turn = true
      next
    when 't'
      view.table model.gems
      user_num = user_validation
      if user_num == 's'
        next_turn = true
        valid = true
        next
      end
      model.gem(user_num)
    when 'l'
      system('clear')
      model.next_gem
    when 'h'
      system('clear')
      model.previous_gem
    when /[1234]/
      puts 'here'
      SystemAPI.new model.current_gem.name, user
    else
      puts 'please enter a valid option'
    end
    view.menu model.current_gem
  end
end
