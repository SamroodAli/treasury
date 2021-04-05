require 'rspec'
require_relative '../lib/model.rb'

describe 'Model' do
  subject(:model){ Model.new("terminal") }
  let(:gem){double("gem")}
  describe '#initialize' do
    it 'should set @gems to an array' do
      expect(subject.gems).to be_an(Array)
    end
  end
  
end
