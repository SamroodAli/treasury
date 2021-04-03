
require 'rspec'
require_relative '../lib/gem.rb'

describe 'GemData' do
  subject(:gem) { GemData.new('0','colorize','1','terminal colors','11111')}
  describe 'initialize' do
    it 'should accept index,name,version,description,downloads' do
      expect{subject}.not_to raise_error
    end

    it 'should set parameters as instance variables' do
      expect(subject.index).to eq('0')
      expect(subject.name).to eq('colorize')
      expect(subject.version).to eq('1')
      expect(subject.description).to eq('terminal colors')
      expect(subject.downloads).to eq('11111')
    end
  end


  describe '#table_row_format' do
    it 'should return an array of length 4' do
      expect(subject.table_row_format.length).to eq 4
    end

    it 'should be all strings of gem data' do
      expect(subject.table_row_format.all?(String)).to be true
    end

  end
end
