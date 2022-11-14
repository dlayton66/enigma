class Offsets
  attr_reader :date,
              :offsets_string,
              :a,
              :b,
              :c,
              :d

  def initialize(date)
    date.nil? ? @date = format(Time.now) : @date = date
    @offsets_string = find_offsets(@date)
    @a = @offsets_string[0].to_i
    @b = @offsets_string[1].to_i
    @c = @offsets_string[2].to_i
    @d = @offsets_string[3].to_i
  end
  
  def format(date)
    date.strftime("%d%m%y")
  end

  def find_offsets(date)
    (date.to_i**2).to_s[-4..-1]
  end
  
  def all
    [@a,@b,@c,@d]
  end
end