require './lib/enigma'
require './lib/keys'
require './lib/offsets'

class Shifts
  attr_reader :keys, :offsets, :seed, :date_seed

  def initialize(seed,date_seed)
    @seed = seed
    @date_seed = date_seed
    @keys = Keys.new(@seed)
    @offsets = Offsets.new(@date_seed)
  end

  def raw_shifts
    [@keys.digits,@offsets.digits].transpose.map {|x| x.reduce(:+)}
  end

  def digits
    # require 'pry'; binding.pry
    raw_shifts.map { |digit| digit % 27 }
  end
end