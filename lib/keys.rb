class Keys
  attr_reader :master_key,
              :a,
              :b,
              :c,
              :d

  def initialize(master_key = format(rand(0...99999)))
    @master_key = master_key
    @a = @master_key[0..1]
    @b = @master_key[1..2]
    @c = @master_key[2..3]
    @d = @master_key[3..4]
  end

  def format(num)
    num.to_s.rjust(5,"0")
  end
  
  def digits
    [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  end
end