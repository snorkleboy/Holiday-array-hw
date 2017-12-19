# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @arr = []
    @maxQueue = []
  end

  def enqueue(val)
    @arr.push(val)
    maxEnqueue(val)
  end

  def dequeue
    if (@arr.shift() == @maxQueue[0])
      @maxQueue.shift()
    end

  end

  def max
    @maxQueue[0]
  end

  def maxEnqueue(val)
    while (!@maxQueue.empty? && @maxQueue[-1]<val)
      @maxQueue.pop
    end
    @maxQueue.push(val)
  end

  def length
    @arr.length
  end

end
