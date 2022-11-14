class Keys
  attr_reader :all,
              :a,
              :b,
              :c,
              :d

  def initialize(all)
    all ? @all = all : @all = format(rand(0...99999))
    @a = @all[0..1].to_i
    @b = @all[1..2].to_i
    @c = @all[2..3].to_i
    @d = @all[3..4].to_i
  end

  def format(num)
    num.to_s.rjust(5,"0")
  end
  
  # def digits
  #   [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  # end
end