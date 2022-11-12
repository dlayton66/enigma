class Keys
  attr_reader :seed,
              :a,
              :b,
              :c,
              :d

  def initialize(seed)
    seed ? @seed = seed : @seed = format(rand(0...99999))
    @a = @seed[0..1]
    @b = @seed[1..2]
    @c = @seed[2..3]
    @d = @seed[3..4]
  end

  def format(num)
    num.to_s.rjust(5,"0")
  end
  
  def digits
    [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  end
end