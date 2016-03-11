class Robot

  MAX_WEIGHT = 250

  attr_reader :x, :y, :items, :health 
  attr_accessor :equipped_weapon

  def initialize(x=0, y=0)
    @x = x
    @y = y
    @items = []
    @health = 100
    @default_attack = 5
  end

  def position
    [x, y]
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

  # def pick_up(item)
  #   if items_weight + item.weight <= MAX_WEIGHT
  #     items << item
  #     if item.is_a?(Weapon)
  #       @equipped_weapon = item
  #     end
  #     item
  #   else
  #     nil
  #   end
  # end

  def pick_up(item)
    return false if items_weight + item.weight > MAX_WEIGHT

    @equipped_weapon = item if item.is_a?(Weapon)
    @items << item
  end

  def items_weight
    total_weight = 0
    if items.count > 0
      @items.each do |item|
        total_weight += item.weight
      end
    end
    total_weight
  end

  def wound(hit)
    if @health - hit >= 0
      @health -= hit
    else
      @health = 0
    end
  end

  def heal(heal)
    if @health + heal <= 100
      @health += heal
    else
      @health = 100
    end
  end

  def attack(enemy)
    if @equipped_weapon
      @equipped_weapon.hit(enemy)
    else
      enemy.wound(@default_attack)
    end
  end

end
