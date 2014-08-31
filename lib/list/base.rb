module List
  class Base
    def initialize
      @nodes = []
    end

    def add(value)
      @nodes << Node.new(value)
    end

    def find(value)
      @nodes.find { |n| n.value == value }
    end

    def values
      @nodes.map(&:value)
    end

    def delete(node)
      @nodes.delete_at(@nodes.index(node))
    end
  end

  class Node < Struct.new(:value); end
end

