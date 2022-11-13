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

  def decrypt(ciphertext, key, date = nil)
    @shifts = Shifts.new(key, date)

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

  def crack(ciphertext,date = Time.now.strftime("%d%m%y"))
    last_four = ciphertext[-4..-1]
    last_four_array = last_four.split("")
    # last_four_array.
    # 27, 5, 14, 4
    last_four_array[0] = (@set.index(last_four_array[0]) - 26) % 27
    last_four_array[1] = (@set.index(last_four_array[1]) - 4) % 27
    last_four_array[2] = (@set.index(last_four_array[2]) - 13) % 27
    last_four_array[3] = (@set.index(last_four_array[3]) - 3) % 27
    
    require 'pry'; binding.pry

    offsets = Offsets.new(date)


    last_four_array.map!.with_index do |num,i|
      num - offsets.digits[i]
    end
require 'pry'; binding.pry

  end
end