require 'rspec'

describe 'System' do
  describe '#initialization' do
    it 'should take in two arguments' do
      expect {SystemAPI.new('colorize','1')}.not_to raise_error
    end
  end
end
