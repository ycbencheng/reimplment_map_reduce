def new_reduce(accumulator = nil, operation = nil, &block)
  if accumulator.nil? && operation.nil? && block.nil?
    raise ArgumentError, 'you must provide an operation or a block'
  end

  if operation && block
    raise ArgumentError, 'you must provide either an operation symbol or a block, not both'
  end

  if operation.nil? && block.nil?
    operation = accumulator
    accumulator = nil
  end

  block = case operation
          when Symbol
            lambda { |acc, value| acc.send(operation, value) }
          when nil
            block
          else
            raise ArgumentError, 'the operation provided must be a symbol'
          end

  if accumulator.nil?
    ignore_first = true
    accumulator = first
  end

  index = 0

  each do |element|
    unless ignore_first && index.zero?
      accumulator = block.call(accumulator, element)
    end
    index += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]
array.new_reduce(0) { |total, a| total + a }
array.new_reduce(:+)
