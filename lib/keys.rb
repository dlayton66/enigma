class Keys
  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize
    @master_key = rand(0...99999).to_s.rjust(5,"0")
    @a_key = @master_key[0..1]
    @b_key = @master_key[1..2]
    @c_key = @master_key[2..3]
    @d_key = @master_key[3..4]
  end
  
end