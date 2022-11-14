require './lib/offsets'

RSpec.describe Offsets do
  let(:offsets) { Offsets.new(nil) }
  
  it 'exists' do
    expect(offsets).to be_a Offsets
  end

  it 'generates a 4-digit string of offsets with nil argument' do
    expect(offsets.all.size).to eq 4
    expect(offsets.all.class).to eq String
  end

  it 'can generate offsets with a date argument' do
    offsets_arg = Offsets.new("040895")

    expect(offsets_arg.all).to eq "1025"
  end

  it 'contains four 1-digit integer offsets' do
    expect(offsets.a.digits.size).to eq 1
    expect(offsets.b.digits.size).to eq 1
    expect(offsets.c.digits.size).to eq 1
    expect(offsets.d.digits.size).to eq 1

    expect(offsets.a.class).to eq Integer
    expect(offsets.b.class).to eq Integer
    expect(offsets.c.class).to eq Integer
    expect(offsets.d.class).to eq Integer
  end
  
  describe '#format' do
    it 'converts a Time object to a date string' do
      date = Time.new(2002, 10, 31)
      
      expect(offsets.format(date)).to eq "311002"
    end
  end
  
  describe '#find_offsets' do
    it 'calculates offsets from date' do
      expect(offsets.find_offsets("040895")).to eq "1025"
      expect(offsets.find_offsets("311002")).to eq "4004"
    end
  end

  # describe '#digits' do
  #   it 'returns an array of offsets in integer form' do
  #     expect(offsets.digits.class).to eq Array
  #     expect(offsets.digits[0].class).to eq Integer
  #     expect(offsets.digits[1].class).to eq Integer
  #     expect(offsets.digits[2].class).to eq Integer
  #     expect(offsets.digits[3].class).to eq Integer
  #   end
  # end
end