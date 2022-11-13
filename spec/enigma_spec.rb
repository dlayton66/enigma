require './lib/enigma'
require './lib/shifts'

RSpec.describe 'Enigma' do
  let (:enigma) { Enigma.new }
  
  it 'exists' do
    expect(enigma).to be_a Enigma
  end

  describe '#encrypt' do
    it 'encrypts a message using a key and date' do
        expected = 
            {
              encryption: "keder ohulw",
              key: "02715",
              date: "040895"
            }
        expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end

    it 'ignores capitalization' do
      expected = 
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      
      expect(enigma.encrypt("hElLo WoRlD", "02715", "040895")).to eq(expected)
    end
  end
  
  describe '#encrypted_array' do
    it 'returns an array where each element is an encrypted character' do
      enigma.encrypt("hello world", "02715", "040895") # just to set seeds
      
      expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
      expect(enigma.encrypted_array("hello world")).to eq(expected)
    end
    
    it 'does not encrypt characters outside the set' do
      enigma.encrypt("hello world", "02715", "040895") # just to set seeds
      
      expected = ["k", "@", "x", "e", "%", "l", "g", "t", "!", "w", "g", "k", "#", "l", "w"]
      expect(enigma.encrypted_array("h@el%lo !wor#ld")).to eq(expected)
    end
  end
  
  describe '#encrypted_message' do
    it 'returns the encrypted message' do
      enigma.encrypt("hello world", "02715", "040895") # just to set seeds
      
      expect(enigma.encrypted_message("hello world")).to eq("keder ohulw")
    end
  end
end

  describe '#decrypt' do
    it 'decrypts a message using a key and date' do
      expected = 
      {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end