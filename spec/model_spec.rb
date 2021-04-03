require 'rspec'
require_relative './../lib/model.rb'


  def initialize(search_input)
    @gems = fetch_gems(search_input)
    @size = @gems.size
  end

  def gem(index)
    @index = index
    @current_gem = @gems[index]
    @current_gem
  end

  def next_gem
    @index = @index == @size - 1 ? 0 : @index + 1
    @current_gem = @gems[@index]
  end

  def previous_gem
    @index = @index.zero? ? @size - 1 : @index - 1
    @current_gem = @gems[@index]
  end


describe 'Model' do
  subject(:model) {Model.new('terminal')}
  
end
