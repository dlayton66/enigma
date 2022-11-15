require './lib/keys'
require './lib/offsets'
require_relative 'arrable'

class Shifts
  include Arrable

  attr_reader :keys, 
              :offsets

  def initialize(key,date)
    @keys = Keys.new(key)
    @offsets = Offsets.new(date)
    @a = @keys.a + @offsets.a
    @b = @keys.b + @offsets.b
    @c = @keys.c + @offsets.c
    @d = @keys.d + @offsets.d
  end

  def raw_shifts
    all.map { |digit| digit % 27 }
  end
end