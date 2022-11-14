require './lib/keys'

RSpec.describe Keys do
  let(:keys) { Keys.new(nil) }

  it 'exists' do
    expect(keys).to be_a Keys
  end

  it 'generates a random 5-digit key all with nil argument' do
    expect(keys.key.length).to eq 5
    expect(keys.key.class).to eq String
  end
  
  it 'can accept a key argument' do
    keys_arg = Keys.new("02715")

    expect(keys_arg.key).to eq "02715"
  end

  it 'contains four 1-2 digit keys' do
    expect(keys.a.to_s.size).to be_between(1,2)
    expect(keys.b.to_s.size).to be_between(1,2)
    expect(keys.c.to_s.size).to be_between(1,2)
    expect(keys.d.to_s.size).to be_between(1,2)
  end

  describe '#format' do
    it 'converts a number into a 5-digit string with padded zeroes' do
      expect(keys.format(45)).to eq "00045"
      expect(keys.format(5023)).to eq "05023"
      expect(keys.format(52058)).to eq "52058"
    end
  end

  describe '#all' do
    it 'returns an array of keys' do
      expect(keys.all.class).to eq Array
      expect(keys.all[0].class).to eq Integer
      expect(keys.all[1].class).to eq Integer
      expect(keys.all[2].class).to eq Integer
      expect(keys.all[3].class).to eq Integer
    end
  end
end