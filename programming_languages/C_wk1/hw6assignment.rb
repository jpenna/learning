# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = Piece::All_Pieces + [
    [
      [[0, 0], [-1, 0], [1, 0], [2, 0], [-2, 0]], # very long (only needs two)
      [[0, 0], [0, -1], [0, 1], [0, 2], [0, -2]]
    ],
    rotations([[0, 0], [0, -1], [1, 0]]),
    rotations([[0, 0], [0, -1], [1, 0], [1, -1], [2, 0]])
  ]

  Single = [[[0, 0]]]

  def self.next_piece (board, cheating = false)
    MyPiece.new(cheating ? Single : All_My_Pieces.sample, board)
  end
end

class MyBoard < Board
  def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
  end

  def next_piece
    @current_block = MyPiece.next_piece(self, @cheating)
    @cheating = false
    @current_pos = nil
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    size =  @current_block.size
    locations.each_index{|index|
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end

  def cheat
    if @cheating or @score < 100
      return
    end
    @cheating = true
    @score -= 100
  end
end

class MyTetris < Tetris
  # your enhancements here
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_clockwise; @board.rotate_clockwise})
    @root.bind('c', proc {@board.cheat})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

end
