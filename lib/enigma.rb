require './lib/shifts'
require './lib/offsets'
require './lib/keys'
require_relative 'doable'

class Enigma
  include Doable

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
    offsets = Offsets.new(date)

    raw_shifts = get_raw_shifts(last_four_indices(ciphertext))
    raw_shifts.rotate!(-ciphertext.size % 4)

    raw_keys = subtract(raw_shifts,offsets.digits)

    key = find_key(raw_keys)

    decrypt(ciphertext,key,date)
  end

  def find_key(raw_keys)
    arr = int_to_str(find_key_array(raw_keys))
    arr[0] + arr[2] + arr[3][1]
  end

  def find_key_array(raw_keys)
    for a in 0..3 do
      for b in 0..3 do
        for c in 0..3 do
          for d in 0..3 do
            displaced = displace(raw_keys,a,b,c,d)
            return displaced if is_key?(displaced)
          end
        end
      end
    end
  end

  def get_raw_shifts(last_four)
    subtracted = subtract(last_four,[26,4,13,3])
    subtracted.map { |num| num % 27 }
  end

  def last_four_indices(string)
    string[-4..-1].split("").map { |char| @set.index(char) }
  end

  def displace(array,a,b,c,d)
    [
      array[0] + a*27, 
      array[1] + b*27, 
      array[2] + c*27,
      array[3] + d*27
    ]
  end
  
  def is_key?(integers)
    strings = int_to_str(integers)
    
    (strings[0][1] == strings[1][0]) && 
    (strings[1][1] == strings[2][0]) && 
    (strings[2][1] == strings[3][0])
  end
end