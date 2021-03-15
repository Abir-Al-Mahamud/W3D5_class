class KnightPathFinder
    
    def self.valid_moves(pos)
        @considered_positions = [pos] 
        row, col = pos 
        possible_pos = [
            [row+2, col+1] , [row+2, col-1],
            [row+1, col+2] , [row+1, col-2],
            [row-1, col+2] , [row-1, col-2],
            [row-2, col+1] , [row-2, col-1]
        ]
        possible_pos.select! do |sub_arr| 
            sub_arr.all? {|el| el != nil} 
        end
        possible_pos.include?(pos)
    end

    attr_reader :pos, :parent, :childern 
    def initialize(pos)
        @pos = pos
        @parent = nil
        @children = []
        
    end

    def root_node
        @pos
    end

    def build_move_tree
      KnightPathFinder.new(self.root_node)
    end

    
end

# start_pos = [2,2]
# starting = KnightPathFinder.new(start_pos)

# p starting 

# puts "root_node #{starting.root_node}"
# p starting.build_move_tree 

# p 
