require"set"
class GraphNode
  attr_accessor :value, :neighbors
  
  def initialize(value)
    @value = value
    @neighbors = []
  end
end

def bfs(start, target)
  queue = [start]
  visited = Set.new([start])
  
  until queue.empty?
    node = queue.shift
    return node if node.value == target
    
    node.neighbors.each do |neighbor|
      unless visited.include?(neighbor)
        queue << neighbor
        visited.add(neighbor)
      end
    end
  end
  
  nil
end

