require 'rspec'
require_relative '../lib/model'

describe 'Model' do
  subject(:model) { Model.new('terminal') }
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

    it 'should return current gem from the gems list' do
      gem = model.gem(10)
      expect(gem).to eq(model.gems[10])
    end
  end

  describe 'next_gem' do
    context 'When not at last gem' do
      it 'should change index to index + 1' do
        model.gem(10)
        model.next_gem
        expect(model.index).to eq(11))
      end
    end

    context 'When at last gem' do
      before(:each) do
        last_gem = model.size - 1
        model.gem(last_gem)
      end

      it 'should not set index  + 1 when at last gem' do
        expect(model.index).not_to eq(last_gem + 1)
      end

      it 'should set to zero for last gem' do
        expect(model.index).to be_zero
      end
    end
  end

  describe 'previous gem' do
    context 'When not at first gem' do
      it 'should set index to index - 1' do
        model.gem(10)
        model.previous_gem
        expect(model.index).to eq(9)
      end
    end
  end
end
