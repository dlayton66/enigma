require './lib/shifts'

class Enigma
  def initialize

  end

  def encrypt(message,key = nil,date = nil)
    shifts = Shifts.new(key,date)
    shifts.digits.map { |digit| digit % 27 }

    alphabet = ("a".."z").to_a << " "
    
    test = message.chars.map.with_index do |char,i|
      alphabet[(alphabet.index(char) + shifts.digits[i%4]) % 27]
    end
    require 'pry'; binding.pry
  end
end