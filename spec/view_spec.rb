require 'rspec'
require_relative '../lib/view'

describe 'View' do
  subject(:view) { View.new }
  let(:gem) { double('gem', menu_data: 'this is some data for testing') }
  let(:model) { double('model', results: [gem, gem, gem]) }
  describe '#menu' do
    it 'should call display play with menu config(gem)' do
      expect { view.menu(gem) }.not_to raise_error
    end
  end
  describe '#table' do
    expect { view.table(gem.results) }.not_to raise_error
  end
end
