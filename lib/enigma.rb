require './lib/shifts'

class Enigma
  def initialize
    @set = ("a".."z").to_a << " "
  end

  def encrypt(message,key = nil,date = nil)
    @key = key
    @date = date
    @shifts = Shifts.new(key,date)

    {
      date: @date,
      encryption: encrypted_message(message.downcase),
      key: @key
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
end