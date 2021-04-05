require 'rspec'
require_relative '../lib/model.rb'

describe 'Model' do
  subject(:model){ Model.new("terminal") }
  describe '#initialize' do
    it 'should set @gems to an array' do
      expect(subject.gems).to be_an(Array)
    end
  end

  describe '@gem' do
    it 'should set index paramter as instance variable @index' do
      model.gem(10)
      expect(subject.index).to eq(10)
    end

    it 'should set @current_gem as as @gems[index]' do
    model.gem(10)
    expect(subject.current_gem).to eq(model.gems[10]) 
    end

    it'should return current gem from the gems list' do
      gem = model.gem(10)
      expect(gem).to eq(model.gems[10])
    end
  end
end
