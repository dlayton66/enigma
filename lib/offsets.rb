class Offsets
  attr_reader :date_seed,
              :seed,
              :a,
              :b,
              :c,
              :d

  def initialize(date_seed)
    date_seed ? @date_seed = date_seed : @date_seed = format(Time.now)
    @seed = calculate_seed(@date_seed)
    @a = @seed[0]
    @b = @seed[1]
    @c = @seed[2]
    @d = @seed[3]
  end
  
  def format(date)
    date.strftime("%d%m%y")
  end

  def calculate_seed(date_seed)
    (date_seed.to_i**2).to_s[-4..-1]
  end
  
  def digits
    [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  end
end