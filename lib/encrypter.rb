require './lib/keys'
require './lib/offsets'

class Encrypter
  attr_reader :shifts, :keys, :offsets

  def initialize
    @keys = Keys.new
    @offsets = Offsets.new
    @shifts = calculate_shifts
  end

  def calculate_shifts
    [@keys.digits,@offsets.digits].transpose.map {|x| x.reduce(:+)}
  end
end