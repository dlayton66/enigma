require './lib/shifts'

class Enigma
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message,key = nil,date = nil)
    shifts = Shifts.new(key,date)
    
    test = message.chars.map.with_index do |char,i|
      @character_set[(@character_set.index(char) + shifts.digits[i%4]) % 27]
    end
    hash = {
      date: shifts.date_seed,
      encryption: test.join(""),
      key: shifts.seed
    }
    hash
  end
end