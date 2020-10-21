class Cell
  attr_reader :coordinate,
              :ship,
              :hit

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @hit        = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @hit
  end

  def fire_upon
    @hit = true
    if @ship != nil
      ship.hit
    end
  end

  def render(visible = false)
    if fired_upon? && @ship != nil && ship.sunk?
      "X"
    elsif fired_upon? && @ship != nil
      "H"
    elsif fired_upon?
      "M"
    elsif @ship != nil && visible == true
      "S"
    else
      "."
    end
  end
end
