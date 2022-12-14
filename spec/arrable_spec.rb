require './lib/arrable'
require './lib/enigma'

RSpec.describe Arrable do
  let(:enigma) { Enigma.new }

  describe '#int_to_str' do
    it 'converts an array of integers into strings with 2 padded zeroes' do
      expect(enigma.int_to_str([3,14,72,8])).to eq(["03","14","72","08"])
    end
  end

  describe '#add' do
    it 'adds corresponding elements from two arrays' do
      expect(enigma.add([10,25,30,40],[8,7,28,12])).to eq([18,32,58,52])
    end
  end

  describe '#subtract' do
    it 'subtracts corresponding elements from two arrays' do
      expect(enigma.subtract([10,25,30,40],[8,7,28,12])).to eq([2,18,2,28])
    end
  end

  # tests for #all in keys_spec and offsets_spec
end
