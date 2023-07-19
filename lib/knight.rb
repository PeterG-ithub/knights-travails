# frozen_string_literal: true

# Knight class
class Knight
  attr_accessor :position#, :move1, :move2, :move3, :move4, :move5, :move6, :move7, :move8

  def initialize(position = [4, 4])
    @position = position
    # @move1 = nil
    # @move2 = nil
    # @move3 = nil
    # @move4 = nil
    # @move5 = nil
    # @move6 = nil
    # @move7 = nil
    # @move8 = nil
  end

  def knight_moves(position, target)
    history = []
    queue = []
    visited = []
    x_axis = [2, 2, -2, -2, 1, 1, -1, -1]
    y_axis = [-1, 1, 1, -1, 2, -2, 2, -2]
    queue.push(position)
    history.push(position)
    visited.push((position[0] + 1) + (position[1]*8))
    target_id = ((target[0] + 1) + (target[1]*8))
    until queue.empty?
      history.push(queue[0])
      8.times do |idx|
        if (position[0] + x_axis[idx]).between?(0, 7) && (position[1] + y_axis[idx]).between?(0, 7) && !visited.any?(target_id)
          queue.push([position[0] + x_axis[idx], position[1] + y_axis[idx]])
          visited.push((position[0] + x_axis[idx] + 1) + (position[1] + y_axis[idx])*8)
          if visited.any?(target_id)
            history.push([position[0] + x_axis[idx], position[1] + y_axis[idx]])
            return [history, history.count - 1]
          end
        end
      end
      history.pop
      queue.shift
      position = queue[0]
    end
  end
end
