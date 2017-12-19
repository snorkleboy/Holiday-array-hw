require_relative "static_array"

class RingBuffer
  attr_reader :length, :arr

  def initialize
    @arr = StaticArray.new(8)
    @start_idx = 0
    @length = 0
  end
  def end_idx
    @start_idx+@length
  end
  # O(1)
  def [](index)
    raise ("index out of bounds") if @length == 0  
    return @arr[@start_idx+index]
  end

  # O(1)
  def []=(index, val)
    @arr[@start_idx+index] = val
  end

  # O(1)
  def pop
        @length -=1
    el = @arr[end_idx]
    @arr[end_idx] = nil

    el
  end

  # O(1) ammortized
  def push(val)
    resize! if (length == @arr.size)
    @arr[end_idx] = val
    @length +=1
    

  end

  # O(1)
  def shift
    el = @arr[@start_idx]
    @arr[@start_idx]=nil
    @start_idx +=1
    @length -=1
    el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if (length == @arr.size)
    @start_idx -=1
    @length +=1
    @arr[@start_idx]=val
    
  end

  protected
  attr_accessor :start_idx
  attr_writer :length
  def store
    @arr
  end
  def check_index(index)
  end
  def capacity
    @arr.size
  end

  def resize!
    temp = @arr

    @arr= StaticArray.new(@arr.size * 2)
    @start_idx = 0
    @length = 0
    temp.arr.each{|item| push(item)}
    p @arr.arr
    p end_idx
  end
end
