module Doable
  def int_to_str(array)
    array.map { |int| int.to_s.rjust(2,"0") }
  end
end