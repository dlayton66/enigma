require './lib/shifts'
require './lib/offsets'
require './lib/keys'
require_relative 'arrable'

class Enigma
  include Arrable

  def initialize
    @set = ("a".."z").to_a << " "
  end

  def encrypt(message,key = nil,date = nil)
    @shifts = Shifts.new(key,date)

    {
      encryption: encrypted_message(message.downcase),
      key: @shifts.keys.key,
      date: @shifts.offsets.date
    }
  end
  
  def encrypted_array(message)
    message.chars.map.with_index do |char,i|
      if @set.include?(char)
        @set[(@set.index(char) + @shifts.all[i%4]) % @set.size]
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
      key: @shifts.keys.key,
      date: @shifts.offsets.date
    }
  end

  def decrypted_array(ciphertext)
    ciphertext.chars.map.with_index do |char,i|
      if @set.include?(char)
        @set[(@set.index(char) - @shifts.all[i%4]) % @set.size]
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

    raw_shifts = last_four_shifts(last_four_indices(ciphertext)).rotate(-ciphertext.size % 4)
    raw_keys = subtract(raw_shifts,offsets.all)

    key = find_key(raw_keys)

    decrypt(ciphertext,key,date)
  end

  def find_key(raw_keys)
    arr = int_to_str(find_key_array(raw_keys))
    arr[0] + arr[2] + arr[3][1]
  end

  def find_key_array(raw_keys)
    for w in 0..3 do
      for x in 0..3 do
        for y in 0..3 do
          for z in 0..3 do
            displaced = displace(raw_keys,w,x,y,z)
            return displaced if is_key?(displaced)
          end
        end
      end
    end
  end

  def last_four_shifts(last_four)
    subtracted = subtract(last_four,[26,4,13,3])
    subtracted.map { |num| num % 27 }
  end

  def last_four_indices(string)
    string[-4..-1].split("").map { |char| @set.index(char) }
  end

  def displace(array,w,x,y,z)
    [
      array[0] + w*27, 
      array[1] + x*27, 
      array[2] + y*27,
      array[3] + z*27
    ]
  end
  
  def is_key?(integers)
    strings = int_to_str(integers)
    
    (strings[0][1] == strings[1][0]) && 
    (strings[1][1] == strings[2][0]) && 
    (strings[2][1] == strings[3][0])
  end
end