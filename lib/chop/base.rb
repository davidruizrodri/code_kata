module Chop
  class Base
    def self.recursive_find(target, values)
      return -1 if values.empty?
      return ((target == values.first) ? 0 : -1) if values.size == 1

      position = recursive_find(target, values[0, values.size / 2])
      return position if position != -1

      position = recursive_find(target, values[values.size / 2, values.size - 1])
      return position + (values.size / 2) if position != -1

      return -1
    end

    def self.iterative_find(target, values)
      start = 0
      stop  = values.size

      while start != stop
        middle = start + (stop - start) / 2
        return middle if values[middle] == target
        target < values[middle] ? stop = middle : start = middle + 1
      end

      return -1
    end
  end
end