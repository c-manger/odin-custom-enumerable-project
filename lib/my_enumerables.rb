module Enumerable
  # Your code goes here
  def my_all?
    result = []
    self.my_each do |elem| 
      result << true if yield(elem)
    end

    if result.length == self.length
      return true
    else
      return false
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    for item in self
      yield(item)
    end
  end
end

test = [1, 1, 2, 3, 5, 8, 13, 21, 34]
puts test.my_all? { |value| value < 5 }