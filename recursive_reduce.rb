class Array
  def recursive_reduce(accumulator = nil, &block)
    return accumulator if empty?
    drop(1).recursive_reduce(accumulator ? yield(accumulator, first) : first, &block)
  end
end

array = [1, 2, 3, 4, 5]
array.recursive_reduce(0) { |total, a| total + a }
