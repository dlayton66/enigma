require './lib/keys'

RSpec.describe Keys do
  let(:keys) { Keys.new }

  it 'exists' do
    expect(keys).to be_a Keys
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