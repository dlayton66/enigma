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
end