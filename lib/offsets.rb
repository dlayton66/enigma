class Offsets
  attr_reader :master_offset,
              :a,
              :b,
              :c,
              :d

  def initialize(date_string = format(Time.now))
    @master_offset = calculate_master_offset(date_string)
    @a = @master_offset[0]
    @b = @master_offset[1]
    @c = @master_offset[2]
    @d = @master_offset[3]
  end
  
  def format(date)
    date.strftime("%d%m%y")
  end

  def calculate_master_offset(date_string)
    (date_string.to_i**2).to_s[-4..-1]
  end
  
  def digits
    [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  end
end