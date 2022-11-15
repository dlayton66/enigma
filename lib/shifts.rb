require './lib/enigma'
require './lib/keys'
require './lib/offsets'
require_relative 'doable'

class Shifts
  include Doable

  attr_reader :key, :date, :keys, :offsets

  def initialize(key,date)
    @key = key
    @date = date
    @keys = Keys.new(@key)
    @offsets = Offsets.new(@date)
  end

  def all
    add(@keys.all,@offsets.all)
  end

  def raw_shifts
    all.map { |digit| digit % 27 }
  end
end