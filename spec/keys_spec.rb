require './lib/keys'

RSpec.describe Keys do
  let(:keys) { Keys.new }

  it 'exists' do
    expect(keys).to be_a Keys
  end

  it 'generates a random 5-digit string master_key by default' do
    expect(keys.master_key.size).to eq 5
    expect(keys.master_key.class).to eq String
  end
  
  it 'can accept a master_key argument' do
    keys_arg = Keys.new("02715")

    expect(keys_arg.master_key).to eq "02715"
  end

  it 'contains four 2-digit keys' do
    expect(keys.a.size).to eq 2
    expect(keys.b.size).to eq 2
    expect(keys.c.size).to eq 2
    expect(keys.d.size).to eq 2
  end

  it 'has keys that share some digits' do
    expect(keys.a[1]).to eq(keys.b[0])
    expect(keys.b[1]).to eq(keys.c[0])
    expect(keys.c[1]).to eq(keys.d[0])
  end

  describe '#format' do
    it 'converts a number into a 5-digit string with padded zeroes' do
      expect(keys.format(45)).to eq "00045"
      expect(keys.format(5023)).to eq "05023"
      expect(keys.format(52058)).to eq "52058"
    end
  end

  describe '#digits' do
    it 'returns an array of keys in integer form' do
      expect(keys.digits.class).to eq Array
      expect(keys.digits[0].class).to eq Integer
      expect(keys.digits[1].class).to eq Integer
      expect(keys.digits[2].class).to eq Integer
      expect(keys.digits[3].class).to eq Integer
    end
  end
end