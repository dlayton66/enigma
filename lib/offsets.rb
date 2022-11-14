class Offsets
  attr_reader :date,
              :all,
              :a,
              :b,
              :c,
              :d

  def initialize(date)
    date.nil? ? @date = format(Time.now) : @date = date
    @all = find_offsets(@date)
    @a = @all[0].to_i
    @b = @all[1].to_i
    @c = @all[2].to_i
    @d = @all[3].to_i
  end
  
  def format(date)
    date.strftime("%d%m%y")
  end

  def find_offsets(date)
    (date.to_i**2).to_s[-4..-1]
  end
  
  # def raw
  #   [@a.to_i,@b.to_i,@c.to_i,@d.to_i]
  # end
end