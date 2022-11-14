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

    last_four = last_four_indices(ciphertext) # [7,18,18,8]
    get_raw_shifts(last_four)

    last_four_array.rotate!(-ciphertext.size % 4)



    last_four = [last_four_array,offsets.digits].transpose.map {|x| x.reduce(:-)}


    for a in 0..3 do
      for b in 0..3 do
        for c in 0..3 do
          for d in 0..3 do
            displaced = displace(last_four,a,b,c,d)
            if is_key?(displaced)
              p displaced
            end
          end
        end
      end
    end
  end

  def get_raw_shifts(last_four)
    [last_four,[26,4,13,3]].transpose.map {|x| x.reduce(:-)}.map { |num| num % 27}
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