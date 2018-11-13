# Write Map in Recursion
class Array
  # enter block to pass in elements
  def recursive_map(&block)
    # if no block is givien turn the array into an enumarator
    return to_enum(:recursive_map) unless block_given?

    # if there is something in the array, insert each block into a new array then drop the first block from the original array and run the code again and join the two together

    if any?
      [yield(first)] + drop(1).recursive_map(&block)
    else
      # Return an array if the give array is empty
      []
    end
  end
end

array = [1, 2, 3, 4, 5]
array.recursive_map { |a| a + a }
array.map { |a| a + a }
array.recursive_map
array.map
