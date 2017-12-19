# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def length
    @arr.length
  end
  def arr
    @arr
  end
  def size
    @size
  end
  def size=(num)
    @size = num
  end
  def initialize(size)
    @arr=Array.new(size)
    @size = size
  end

  # O(1)
  def [](index)
    if (index<length && length>0)
       return @arr[index%length]
    end
     raise 'index out of bounds'
  end

  # O(1)
  def []=(index, value)
    if (index<@size)
        @arr[index%length] = value
    else
      raise 'index out of bounds'
    end
  end

  protected
  attr_accessor :store
end
