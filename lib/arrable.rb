# Performs various array functions

module Arrable
  def int_to_str(array)
    array.map { |int| int.to_s.rjust(2,"0") }
  end

  def add(arr1,arr2)
    [arr1,arr2].transpose.map {|x| x.reduce(:+)}
  end

  def subtract(arr1,arr2)
    [arr1,arr2].transpose.map {|x| x.reduce(:-)}
  end

  def all
    [@a,@b,@c,@d]
  end
end