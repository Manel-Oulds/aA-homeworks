class Stack
  #last in first out
  attr_reader :varstack
  def initialize
    @var_stack = []
  end

  def push(el)
    var_stack.push(el)
    el
  end

  def pop
    var_stack.pop
  end

  def peek
    var_stack.last
  end
end



class Queue
  #first in firt out
  attr_reader :varstack
  def initialize
    @var_stack = []
  end

  def enqueue(el)
    var_stack.push(el)
  end

  def dequeue
    var_stack.shift
  end

  def peek
    var_stack.first
  end
end


class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        return @map
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def delete(key)
    @map.each do |pair|
      if pair[0] == key
        @map.delete(pair)
        return
      end
    end
  end

  def show
    @map.each do |pair|
      puts "#{pair[0]} -> #{pair[1]}"
    end
  end
end


