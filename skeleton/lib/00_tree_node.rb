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

    
end