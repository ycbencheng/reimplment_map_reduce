# Rewriting the map method
class Array
  def new_map
    # if no block is givien turn the array into an enumarator
    return to_enum(:new_map) unless block_given?
    # create a new array
    new_array = []
    # loop through and insert each element into the new array
    each { |e| new_array << yield(e) }
    # return the new array
    new_array
  end
end

array = [1,2,3,4,5]
p array.new_map { |a| a*a }
p array.map { |a| a*a }
p array.new_map
p array.map