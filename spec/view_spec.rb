require 'rspec'
require_relative './../lib/view'

describe 'View' do
  subject(:view) { View.new }
  let(:gem) do
    double('gem', 'name' => 'colorize', 'description' => 'some description', 'version' => '1', 'downloads' => '4444',
                  'index' => '20', 'table_row_format' => %w[0 colorize 1 4444])
  end
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
