require_relative "tile"

class Board

attr_reader :grid;

  def initialize
    @grid = Array.new(9) {Array.new(9) {Tile.new}}

  end

  def generate_bombs
    random_generator.each do |coordinate|
      grid[coordinate[0]][coordinate[1]].set_bomb
      surround_coord = generate_surrounding_coordinates(coordinate)
      surround_coord.each do |s_coord|
        if s_coord[0] > 0 && s_coord[0] < 8 && s_coord[1] > 0 && s_coord[1] < 8
          @grid[s_coord[0]][s_coord[1]].bomb_count
        end
      end
    end
  end

  def random_generator
    arr = []
    until arr.length == 10
      coord = [rand(9),rand(9)]
      arr << coord unless arr.include?(coord)
    end
    arr
  end

  def generate_surrounding_coordinates(coordinate)
    array_coordinates = []
    array_coordinates << [coordinate[0],coordinate[1]-1]
    array_coordinates << [coordinate[0],coordinate[1]+1]
    array_coordinates << [coordinate[0]-1,coordinate[1]]
    array_coordinates << [coordinate[0]+1,coordinate[1]]
    array_coordinates << [coordinate[0]-1,coordinate[1]-1]
    array_coordinates << [coordinate[0]+1,coordinate[1]-1]
    array_coordinates << [coordinate[0]-1,coordinate[1]+1]
    array_coordinates << [coordinate[0]+1,coordinate[1]+1]

    array_coordinates

  end

  def render
    grid[0..9].each do |array|
      array.each do |el|
        el.to_s
      end
    end
  end
end
