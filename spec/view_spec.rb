require 'rspec'
require_relative '../lib/view'

describe 'View' do
  subject(:view) { View.new }
  let(:gem) { double('gem','name'=>'colorize') }
  let(:model) { double('model', results: [gem, gem, gem]) }
  describe '#menu' do
    it 'should not raise issue for gem terminal-basic-menu' do
      expect { view.menu(gem) }.not_to raise_error
    end
  end
  describe '#table' do
    it 'should not raise issue for temrinal table gem' do
      expect { view.table(model.results) }.not_to raise_error
    end
  end
end
