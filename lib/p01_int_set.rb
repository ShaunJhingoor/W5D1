class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max,false) 
  end

  def insert(num)
    if num > @max || num < 0 
      raise "Out of bounds"
    
    else 
      @store[num] = true 
      
    end
  end


  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_reader :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    # @num_buckets= num_buckets
  end

  def insert(num)
    index = num % @store.length
    if !@store[index].include?(num) 
       @store[index] << num 
    end
  end

  def remove(num)
    index = num % @store.length
    @store[index].delete(num)
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    index = num % @store.length
    if !@store[index].include?(num) 
       @store[index] << num 
       @count += 1 
    end
    if count > @store.length
      self.resize!
    end
  end

  def remove(num)
    index = num % @store.length
    if @store[index].include?(num)
      @store[index].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num) 
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    num_new_buckets = @store.length
    new_size = @store.length * 2
    stores = self.store
    
      num_new_buckets.times {@store << Array.new}

      stores.flatten.each do |ele|
       
          new_idx = ele % new_size
          @store[new_idx] << ele
      end
  end


  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end