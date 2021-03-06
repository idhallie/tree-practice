class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  def add_helper(current_node, key, value)
    return TreeNode.new(key,value) if current_node.nil?
    
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value) 
    end
    
    return current_node
  end
  
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value)
    new_node = TreeNode.new(key,value)
    
    if @root.nil?
      @root = new_node
    else  
      add_helper(@root, key, value)
    end
  end
  
  # Time Complexity: Best: O(log n), Worst: O(n)
  # Space Complexity: O(n)
  def find_helper(current_node, key)
    return if current_node.nil?
    
    if key < current_node.key
      current_node.left = find_helper(current_node.left, key)
    elsif key > current_node.key
      current_node.right = find_helper(current_node.right, key)
    else
      return current_node.value
    end
    
  end
  
  def find(key)
    return if @root.nil?
    
    if @root == key
      return @root.value
    else
      find_helper(@root, key)
    end 
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current_node, list)
    return list if current_node.nil?
    # left side
    inorder_helper(current_node.left, list)
    # middle node
    list << { key: current_node.key, value: current_node.value }
    # right side
    inorder_helper(current_node.right, list)
    return list
  end
  
  def inorder
    return inorder_helper(@root, [])
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current_node, list)
    return list if current_node.nil?
    # middle node
    list << { key: current_node.key, value: current_node.value }
    # left side
    preorder_helper(current_node.left, list)
    # right side
    preorder_helper(current_node.right, list)
    
    return list
  end
  
  def preorder
    return preorder_helper(@root, [])
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current_node, list)
    return list if current_node.nil?
    # left side
    postorder_helper(current_node.left, list)
    # right side
    postorder_helper(current_node.right, list)
    # middle node
    list << { key: current_node.key, value: current_node.value }
    
    return list
  end
  
  def postorder
    return postorder_helper(@root, [])
  end
  
  # Time Complexity: O(n)
  # Space Complexity:O(n)
  def height_helper(current_node)
    if current_node.nil?
      return 0
    else
      left = height_helper(current_node.left)
      right = height_helper(current_node.right)
      
      if (left > right)
        return left + 1
      else
        return right + 1
      end
    end
  end
  
  def height
    if @root.nil?
      return 0 
    else
      height_helper(@root)
    end
  end
  
  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
