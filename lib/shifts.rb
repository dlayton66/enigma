require './lib/keys'
require './lib/offsets'

class Shifts
  attr_reader :digits, :keys, :offsets

  def initialize
    @keys = Keys.new
    @offsets = Offsets.new
    @digits = calculate_shifts
  end

  def calculate_shifts
    [@keys.digits,@offsets.digits].transpose.map {|x| x.reduce(:+)}
  end
end