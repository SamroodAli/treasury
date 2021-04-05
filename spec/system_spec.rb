require 'rspec'
require_relative '../lib/system'

describe 'System' do
  subject(:system) { SystemAPI('colorize', '1') }
  describe '#initialization' do
    it 'should take in two arguments' do
      expect { system }.not_to raise_error
    end
    it 'should not set any instance variables' do
      expect(system.instance_variables.count).to be_zero
    end
  end
end
