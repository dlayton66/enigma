require './lib/shifts'
require './lib/offsets'
require './lib/keys'

class Enigma
  def initialize
    @set = ("a".."z").to_a << " "
  end

  def encrypt(message,key = nil,date = nil)
    @shifts = Shifts.new(key,date)

    {
      encryption: encrypted_message(message.downcase),
      key: @shifts.keys.seed,
      date: @shifts.offsets.date_seed
    }
  end
  
  def encrypted_array(message)
    message.chars.map.with_index do |char,i|
      if @set.include?(char)
        @set[(@set.index(char) + @shifts.digits[i%4]) % @set.size]
      else
        char
      end
    end
  end
  
  def encrypted_message(message)
    encrypted_array(message).join("")
  end

  def decrypt(ciphertext,key,date = nil)
    @shifts = Shifts.new(key,date)

    {
      decryption: decrypted_message(ciphertext),
      key: @shifts.keys.seed,
      date: @shifts.offsets.date_seed
    }
  end

  def decrypted_array(ciphertext)
    ciphertext.chars.map.with_index do |char,i|
      if @set.include?(char)
        @set[(@set.index(char) - @shifts.digits[i%4]) % @set.size]
      else
        char
      end
    end
  end

  def decrypted_message(ciphertext)
    decrypted_array(ciphertext).join("")
  end
end