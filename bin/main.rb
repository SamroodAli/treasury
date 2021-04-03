require_relative('../lib/model')
require_relative('../lib/system')
require_relative('../lib/view')

def user_validation(view, model)
  system('clear')
  view.table model.gems
  puts 'Enter an index to select a gem'
  puts 'Enter q to quit'
  puts 'Enter s to search again'
  puts 'Enter anything else to select first gem'
  gem_num = gets.chomp
  system('clear')
  case gem_num
  when 'q'
    abort
  when 's'
    return 's'
  end
  if gem_num.to_i.between?(0, model.size - 1)
    model.gem gem_num.to_i
  else
    model.gem(0)
  end
end

def display_table(view, model)
  next_turn, valid = false
  user_num = user_validation view, model
  if user_num =~ /[sS]/
    next_turn = true
    valid = true
    system('clear')
  end
  [next_turn, valid]
end

next_turn = true
while next_turn

  next_turn = false
  puts 'Hello, what dependency are you looking for ?'
  puts 'Enter q to quit'
  user_choice = gets.chomp

  abort if user_choice =~ /[qQ]/
  model = Model.new user_choice
  if model.gems.empty?
    puts 'Sorry, no gems available for your search'
    puts 'Restarting the program'
    next_turn = true
    next
  end

  view = View.new
  next_turn, valid = display_table view, model
  next if next_turn

  system('clear')
  view.menu model.current_gem
  until valid
    user = gets.chomp
    case user
    when /[qQ]/
      valid = true
      break
    when /[sS]/
      valid = true
      next_turn = true
      next
    when /[tT]/
      next_turn, valid = display_table view, model
    when /[lL]/
      system('clear')
      model.next_gem
    when /[hH]/
      system('clear')
      model.previous_gem
    when /[1234]/
      SystemAPI.new model.current_gem.name, user
    else
      puts 'Please enter a valid option'
    end
    view.menu model.current_gem unless next_turn
  end
end
