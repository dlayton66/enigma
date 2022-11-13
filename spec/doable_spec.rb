require './lib/doable'
require './lib/enigma'

RSpec.describe Doable do
  let(:enigma) { Enigma.new }

  describe '#int_to_str' do
    it 'converts an array of integers into strings with 2 padded zeroes' do
      expect(enigma.int_to_str([3,14,72,8])).to eq(["03","14","72","08"])
    end
  end
end
