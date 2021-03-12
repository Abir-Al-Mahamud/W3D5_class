class PolyTreeNode

    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end 

    def parent=(new_node)
        if !@parent.nil?                       
            @parent.children.delete(self)
        end 
        
        @parent = new_node
        new_node.children << self if !@parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise "error"
        end
    end

    def dfs(root, target)
        return root if root.value == target

        root.children.each do |child|
            dfs(child, target)
            if child.value == target
                return child
            end
        end
        
        nil
    end


    
end

