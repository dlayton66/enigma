require './lib/keys'
require './lib/offsets'

class Shifts
  attr_reader :digits, :keys, :offsets, :seed, :date_seed

  def initialize(seed,date_seed)
    @seed = seed
    @date_seed = date_seed
    @keys = Keys.new(@seed)
    @offsets = Offsets.new(@date_seed)
    @digits = calculate_shifts
  end

  def calculate_shifts
    [@keys.digits,@offsets.digits].transpose.map {|x| x.reduce(:+)}
  end
end