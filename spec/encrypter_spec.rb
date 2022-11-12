require './lib/encrypter'

RSpec.describe Encrypter do
  let(:encrypter) { Encrypter.new }

  it 'exists' do
    expect(encrypter).to be_a Encrypter
  end  

  describe '#calculate_shifts' do
    it 'returns an array with keys and offsets added together' do
      expect(encrypter.shifts[1]).to eq(encrypter.keys.digits[1]+encrypter.offsets.digits[1])
      expect(encrypter.shifts[3]).to eq(encrypter.keys.digits[3]+encrypter.offsets.digits[3])
    end
  end
end