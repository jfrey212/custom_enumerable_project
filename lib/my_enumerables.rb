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
      if block_given?
        if yield(x) == false
          return false
        end
      else
        return true
      end
    end
    true
  end

  def my_any?
    my_each do |x|
      if block_given?
        if yield(x) == true
          return true
        end
      else
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |x|
      if block_given?
        if yield(x) == true
          return false
        end
      else
        return false
      end
    end
    true
  end

  def my_count
    i = 0
    my_each do |x|
      if block_given?
        next unless yield(x) == true

        i += 1
      else
        i += 1
      end
    end
    i
  end

  def my_map
    new_arr = []

    my_each do |x|
        new_arr << yield(x)
    end
    new_arr
  end

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
