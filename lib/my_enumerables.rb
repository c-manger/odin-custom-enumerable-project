module Enumerable
  # Your code goes here
  def my_all?
    result = []
    self.my_each do |elem| 
      result << true if yield(elem)
    end

    result.length == self.length
  end

  def my_any?
    any = false
    self.my_each do |elem|
      break any = true if yield(elem)
    end
    any
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_each_with_index
    if block_given?
      result = []
      count = 0

      for item in self
        result << [item, count]
        count += 1
      end

      for item in result
        yield(item[0], item[1])
      end

      self
    else
      result = []
      count = 0
      for item in self
        result << [item, count]
        count += 1
      end
      return result.to_enum
    end
  end

  def my_inject(initial_value)
    result = initial_value
    for elem in self
      result = yield(result, elem)
    end
    result
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    result_array = []
    for elem in self
      result_array << yield(elem)
    end
    result_array
  end

  def my_none?
    none = true
    self.my_each do |elem|
      break none = false if yield(elem)
    end
    none
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    self.my_each do |elem| 
      result << elem if yield(elem) == true
    end

    result
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

