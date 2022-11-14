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
    it 'encrypts message into an array of characters' do
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

    it 'uses today as date seed by default' do
      expected = 
      {
        decryption: "hello world",
        key: "02715",
        date: Time.now.strftime("%d%m%y")
      }
      encryption = enigma.encrypt("hello world", "02715")[:encryption]

      expect(enigma.decrypt(encryption,"02715")).to eq(expected)
    end
  end

  describe '#decrypted_array' do
    it 'decrypts ciphertext into an array of characters' do
      enigma.decrypt("keder ohulw", "02715", "040895") # just to set seeds

      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
      expect(enigma.decrypted_array("keder ohulw")).to eq(expected)
    end
  end

  describe '#decrypted_message' do
    it 'returns the decrypted message' do
      enigma.decrypt("keder ohulw", "02715", "040895") # just to set seeds

      expect(enigma.decrypted_message("keder ohulw")).to eq("hello world")
    end
  end

  describe '#crack' do
    it 'decrypts the message assuming it ends with " end"' do
      expected =
      {
        decryption: "hello world end",
        key: "08304",
        date: "291018"
      }
      # 14, 86, 32, 8
      # => "vjqtbeaweqihssi"
      encryption = enigma.encrypt("hello world end","08304", "291018")[:encryption]
      expect(enigma.crack(encryption,"291018")).to eq(expected)
    end

    it 'uses today as date by default' do
      expected =
      {
        decryption: "hello world end",
        key: "08304",
        date: Time.now.strftime("%d%m%y")
      }
      encryption = enigma.encrypt("hello world end","08304")[:encryption]
      expect(enigma.crack(encryption)).to eq(expected)
    end
  end

  describe '#displace' do
    it 'displaces the values of an array by given multiples of 27' do
      expect(enigma.displace([8,2,3,4],0,3,1,0)).to eq([8,83,30,4])
    end
  end

  describe '#is_key?' do
    it 'determines if an array of integers is eligible to be a key' do
      expect(enigma.is_key?([8,83,30,4])).to be true
      expect(enigma.is_key?([27,71,15,54])).to be true
      expect(enigma.is_key?([0,0,0,0])).to be true

      expect(enigma.is_key?([27,7,70,4])).to be false
      expect(enigma.is_key?([58,89,9,94])).to be false
    end
  end
end