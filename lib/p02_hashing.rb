class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.inject{|acc,el| acc + el * 2}.hash
  #  total = 0
  #  self.each do |ele|
  #   total += ele.hash
  # end
  # total

end
end

class String
  def hash
   arr = self.chars
   total = []
   arr.each_with_index do |el, i|
    total << i
   end 

   total.inject{|acc,el| acc + el * 2}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end