require './lib/offsets'

RSpec.describe Offsets do
  let(:offsets) { Offsets.new }
  
  it 'exists' do
    expect(offsets).to be_a Offsets
  end

  it 'contains four 1-digit offsets' do
    expect(offsets.a.size).to eq 1
    expect(offsets.b.size).to eq 1
    expect(offsets.c.size).to eq 1
    expect(offsets.d.size).to eq 1
  end

  describe '#digits' do
    it 'returns an array of offsets in integer form' do
      expect(offsets.digits.class).to eq Array
      expect(offsets.digits[0].class).to eq Integer
      expect(offsets.digits[1].class).to eq Integer
      expect(offsets.digits[2].class).to eq Integer
      expect(offsets.digits[3].class).to eq Integer
    end
  end
end