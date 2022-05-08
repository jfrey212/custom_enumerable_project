# frozen_string_literal: true

# Add custom enumerable methods to enumerable class
module Enumerable
  def my_each_with_index
    index = 0
    my_each do |x|
      yield(x, index)
      index += 1
    end
  end

  def my_select
    new_arr = []
    my_each do |x|
      next unless yield(x) == true

      new_arr << x
    end
    new_arr
  end

  def my_all?
    my_each do |x|
      if yield(x) == false
        return false
      end
    end
    true
  end

  def my_any?
    my_each do |x|
      if yield(x) == true
        return true
      end
    end
    false
  end

  def my_none?; end

  def my_count; end

  def my_map; end

  def my_inject; end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i]) if block_given?
      i += 1
    end
  self
  end
end
