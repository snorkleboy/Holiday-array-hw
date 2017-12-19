require_relative "static_array"

class DynamicArray
  def initialize
    @arr = StaticArray.new(10)
  end
  def length
    @arr.length
  end
  # O(1)
  def [](index)
    @arr[index]
  end

  # O(1)
  def []=(index, value)
    @arr[index]=value
  end

  # O(1)
  def pop
    @arr.pop
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if (@arr.length == @arr.size)
      resize!
    end
    # if (@fps < 60)
    #   fps = 60
    # end
    @arr.push(val)
  end

  # O(n): has to shift over all the elements.
  def shift
    @arr.shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @arr.unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @arr.size *=2
  end
end
