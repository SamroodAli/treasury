require 'colorize'
require_relative './../lib/model'
require_relative './../lib/system'
require_relative './../lib/view'

def user_validation(view, model)
  system('clear')
  view.table model.gems
  puts 'Enter q to quit'.colorize(:red)
  puts 'Enter an index to select a gem'.colorize(:cyan)
  puts 'Enter s to search again'.colorize(:yellow)
  puts 'Enter anything else to select first gem'.colorize(:green)
  gem_num = gets.chomp
  system('clear')
  case gem_num
  when 'q'
    abort
  when 's'
    system('clear')
    's'
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
  end
  [next_turn, valid]
end

next_turn = true
restart = false
while next_turn
  system('clear') unless restart
  restart = true
  next_turn = false
  puts 'Hello, what dependency are you looking for ?'.colorize(:green)
  puts 'Enter q to quit'.colorize(:red)
  user_choice = gets.chomp

  abort if user_choice =~ /[qQ]/
  model = Model.new user_choice
  if model.gems.empty?
    puts 'Sorry, no gems available for your search'
    restart = true
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
      system('clear')
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
