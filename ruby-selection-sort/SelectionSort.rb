# Create a class to store both value and original index
class Element
  attr_accessor :value, :index

  def initialize(value, index)
    @value = value
    @index = index
  end

  # Implement < operator for comparison
  def <(other)
    if @value == other.value
      @index < other.index
    else
      @value < other.value
    end
  end

  def to_s
    "#{@value} (index #{@index})"
  end
end

def selection_sort(arr)
  # Convert input array to array of Elements with original indices
  elements = arr.each_with_index.map { |value, index| Element.new(value, index) }
  n = elements.length

  # Selection sort
  (0...n).each do |i|
    min_index = i

    # Find minimum element considering both value and original index
    (i + 1...n).each do |j|
      if elements[j] < elements[min_index]
        min_index = j
      end
    end

    # Swap elements if needed
    if min_index != i
      elements[i], elements[min_index] = elements[min_index], elements[i]
    end

    # Print current state of array after each swap
    puts "Step #{i + 1}: #{elements.join(', ')}"
  end

  elements
end

# Example usage
puts "Example 1:"
arr = [64, 34, 25, 12, 22, 11, 90]
puts "Original array with indices:"
arr.each_with_index { |val, idx| puts "#{val} (index #{idx})" }
puts "\nSorting process:"
sorted = selection_sort(arr)
puts "\nFinal sorted array:"
puts sorted.join(', ')

puts "\nExample 2 (with duplicate values):"
arr2 = [5, 3, 1, 4, 3, 1]
puts "Original array with indices:"
arr2.each_with_index { |val, idx| puts "#{val} (index #{idx})" }
puts "\nSorting process:"
sorted2 = selection_sort(arr2)
puts "\nFinal sorted array:"
puts sorted2.join(', ')
