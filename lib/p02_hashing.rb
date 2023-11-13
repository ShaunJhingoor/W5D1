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
    alpha = 'abcdefghijklmnopqrstuvwxyz'
    my_hash = {}
    ('a'..'z').to_a.each_with_index do |ele, i|
      my_hash[ele] = i
    end
    nums = self.chars.map!{|ele| ele = my_hash[ele.downcase] unless !alpha.include?(ele.downcase)}
    nums.inject{|acc,el| acc + el * 7}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.length.hash
  end
end