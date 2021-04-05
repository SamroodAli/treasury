require 'rspec'
require_relative '../lib/view'

describe 'View' do
  subject(:view) { View.new }
  let(:gem) { double('gem', :menu_data: 'this is some data for testing',:name=>'colorize',:table_row_format=['0','colorize','0.1','50000']) }
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
