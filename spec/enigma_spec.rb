require './lib/enigma'

RSpec.describe 'Enigma' do
  let (:enigma) { Enigma.new }

  it 'exists' do
    expect(enigma).to be_a Enigma
  end

  describe '#encrypt' do
    it 'encrypts a message with a key and date' do
        expected = 
            {
              encryption: "keder ohulw",
              key: "02715",
              date: "040895"
            }
        expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  end
end