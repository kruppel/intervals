module BST
  class Node < Struct.new(:value, :left, :right)
    def to_json(*args)
      hash = {
        value: value
      }

      hash[:left] = self.left.to_json unless self.left.nil?
      hash[:right] = self.right.to_json unless self.right.nil?

      hash
    end
  end

  attr_reader :root

  def add(value)
    node = root

    if node.nil?
      @root = Node.new(value)
      return
    end

    while !node.nil?
      node_value = node.value
      dir = nil

      if node_value > value
        dir = :left
      elsif node_value < value
        dir = :right
      else
        return
      end

      if node[dir].nil?
        node[dir] = Node.new(value)
      else
        node = node[dir]
      end
    end
  end

  def to_json
    root.to_json
  end
end
