require 'byebug'

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

    def inspect
        { 
            "value" => self.value, 
            "parent" => self.parent, 
            "children" => self.children.map(&:value)
        }

    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            result = child.dfs(target) 
            return result if result != nil
        end

        nil
    end

    def bfs(target)
        que = [self]

        while !que.empty?
            if que.first.value == target
                return que.first
            end
            old_ele = que.shift
            que.concat(old_ele.children)
        end
        nil
    end 
    
end
