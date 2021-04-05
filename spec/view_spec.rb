require 'rspec'

describe 'View' do
  subject(:view){ View.new}

  describe('#menu') do
    it 'is expected not raise error' do
      expect{is_expected}.not_to raise_error
    end
  end
end
