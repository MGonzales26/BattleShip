class Board
  attr_reader :cells,
              :rows,
              :columns

  def initialize
    @cells   = make_cells
    @rows    = rows
    @columns = columns
  end

  def create_board
    size = 4
    alphabet = ("A".."Z").to_a
    @rows = (1..size).to_a
    @columns = ("A"..alphabet[size-1]).to_a
    coords = @columns.map do |letter|
      @rows.map do |number|
        letter + number.to_s
      end
    end
    coords.flatten
  end

  def make_cells
    cells = {}
    create_board.map do |coor|
      cells[coor] = Cell.new(coor)
    end
    cells
  end

  def valid_coordinate?(coord)
    @cells.any? do |name, cell|
      cell.coordinate == coord
    end
  end

  def valid_ship_length?(ship, placement)
    ship.length == placement.count
  end

  def isolate_numbers(placement)
    placement.map do |place|
      place[1].to_i
    end
  end

  def numbers_consecutive?(placement)
    number_group = @rows.each_cons(placement.count).to_a
    number_group.any? do |numbers|
      isolate_numbers(placement) == numbers
    end
  end

  def isolate_letters(placement)
    placement.map do |place|
      place[0].ord
    end
  end

  def ord_columns
    @columns.map do |letter|
      letter.ord
    end
  end

  def letters_consecutive?(placement)
    letter_group = ord_columns.each_cons(placement.count).to_a
    letter_group.any? do |letters|
      isolate_letters(placement) == letters
    end
  end

  def numbers_same?(placement)
    isolate_numbers(placement).uniq.count == 1
  end

  def letters_same?(placement)
    isolate_letters(placement).uniq.count == 1
  end

  def valid_placement?(ship, placement)
    valid_ship_length?(ship, placement) &&
    ((numbers_consecutive?(placement)  && letters_same?(placement)) || (letters_consecutive?(placement) && numbers_same?(placement))) &&
    !(numbers_consecutive?(placement) && letters_consecutive?(placement)) &&
    !overlap?(placement)
  end

  def place(ship, placement)
    placement.each do |place|
      @cells[place].place_ship(ship)
    end
  end

  def overlap?(placement)
    !placement.all? do |place|
      @cells[place].empty?
    end
  end

  def render(visible = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(visible)} #{@cells["A2"].render(visible)} #{@cells["A3"].render(visible)} #{@cells["A4"].render(visible)} \n" +
    "B #{@cells["B1"].render(visible)} #{@cells["B2"].render(visible)} #{@cells["B3"].render(visible)} #{@cells["B4"].render(visible)} \n" +
    "C #{@cells["C1"].render(visible)} #{@cells["C2"].render(visible)} #{@cells["C3"].render(visible)} #{@cells["C4"].render(visible)} \n" +
    "D #{@cells["D1"].render(visible)} #{@cells["D2"].render(visible)} #{@cells["D3"].render(visible)} #{@cells["D4"].render(visible)} \n"
  end
end
