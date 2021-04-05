require 'rspec'
require_relative '../lib/system'

describe 'System' do
  describe '#initialization' do
    it 'should take in two arguments' do
      expect { SystemAPI }.not_to raise_error
    end
  end
end
