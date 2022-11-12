require './lib/offsets'

RSpec.describe Offsets do
  let(:offsets) { Offsets.new }
  
  it 'exists' do
    expect(offsets).to be_a Offsets
  end

  it 'generates a 4-digit string master_offset by default' do
    expect(offsets.master_offset.size).to eq 4
    expect(offsets.master_offset.class).to eq String
  end

  it 'can generate a master_offset with a date argument' do
    offsets_arg = Offsets.new("040895")

    expect(offsets_arg.master_offset).to eq "1025"
  end

  it 'contains four 1-digit offsets' do
    expect(offsets.a.size).to eq 1
    expect(offsets.b.size).to eq 1
    expect(offsets.c.size).to eq 1
    expect(offsets.d.size).to eq 1
  end

  describe '#date_string' do
    it 'converts a Time object to a date string' do
      date = Time.new(2002, 10, 31)
      
      expect(offsets.date_string(date)).to eq "311002"
    end
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