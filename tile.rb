class Tile

  attr_reader :has_bomb, :surround_bomb, :flagged, :revealed

  def initialize
    @has_bomb = false
    @surround_bomb = 0
    @flagged = false
    @revealed = false
  end

  def set_bomb
    @has_bomb = true
  end

  def flag
    @flagged = true
  end

  def reveal
    @revealed = true
  end

  def bomb_count
    @surround_bomb += 1
  end

  def to_s
    b = " "
    if has_bomb
      b = "*"
    end
    string = surround_bomb.to_s + b
  end
end
