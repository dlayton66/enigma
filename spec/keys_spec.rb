require './lib/keys'

RSpec.describe Keys do
  let(:keys) { Keys.new }

  it 'exists' do
    expect(keys).to be_a Keys
  end

  it 'contains four 2-digit keys' do
    expect(keys.a_key.size).to eq 2
    expect(keys.b_key.size).to eq 2
    expect(keys.c_key.size).to eq 2
    expect(keys.d_key.size).to eq 2
  end

  it 'has keys that share some digits' do
    expect(keys.a_key[1]).to eq(keys.b_key[0])
    expect(keys.b_key[1]).to eq(keys.c_key[0])
    expect(keys.c_key[1]).to eq(keys.d_key[0])
  end
end