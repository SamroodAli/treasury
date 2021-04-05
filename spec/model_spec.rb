require 'rspec'
require_relative '../lib/model.rb'

describe 'Model' do
  subject(:model){ Model.new("terminal") }
  let(:gem){double("gem")}
  describe '#initialize' do
    it 'should set @gems to an array' do
      expect(subject.gems).to be_an(Array)
    end

    it 'should only have gems' do
      expect(subject.gems).to be_all(:gem)
    end
  end

  describe '@gem' do
    it 'should set index paramter as instance variable @index' do
      subject.gem(10)
      expect(subject.index).to eq(10)
    end

    it 'should set @current_gem as as @gems[index]' do
     expect(subject.current_gem).to eq(subject.gems[10]) 
    end

    it 'should return current gem from the gems list' do
      expect(subject.gem).to eq(subject.gems[10])
    end
  end
end
