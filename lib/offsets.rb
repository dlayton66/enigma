class Offsets
  attr_reader :a,
              :b,
              :c,
              :d

  def initialize
    @master_offset = (Time.now.strftime("%d%m%y").to_i**2).to_s[-4..-1]
    @a = @master_offset[0]
    @b = @master_offset[1]
    @c = @master_offset[2]
    @d = @master_offset[3]
  end
end