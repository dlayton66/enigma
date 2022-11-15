class Keys
  attr_reader :key,
              :a,
              :b,
              :c,
              :d

  def initialize(key)
    key ? @key = key : @key = format(rand(0...99999))
    @a = @key[0..1].to_i
    @b = @key[1..2].to_i
    @c = @key[2..3].to_i
    @d = @key[3..4].to_i
  end

  def format(num)
    num.to_s.rjust(5,"0")
  end
  
  def all
    [@a,@b,@c,@d]
  end
end