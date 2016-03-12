class MyError < StandardError
end

class Robot

  MAX_WEIGHT = 250

  attr_reader :position, :items, :health 
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = 100
    @default_attack = 5
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
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

    if item.is_a?(BoxOfBolts) && self.health <= 80
      item.feed(self)
    elsif item.is_a?(Weapon)
      @equipped_weapon = item
      @items << item
    else
      items << item
    end
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

  # def items_weight
  #   @items.reduce(0) do |sum, item|
  #     sum + item.weight
  #   end
  # end

  # @products.reduce(0) do |sum, product|
  #   product.price_per_unit * product.quantity + sum
  # end

  def wound(hit)
    if @health - hit >= 0
      @health -= hit
    else
      @health = 0
    end
  end

  def heal(heal)
    if @health <= 0
      raise MyError, "Can not heal when health is 0 or below"
    else
      if @health + heal <= 100
        @health += heal
      else
        @health = 100
      end
    end
  end

  def attack(enemy)
    if enemy.is_a?(Robot)
      if (self.position[0] - enemy.position[0]).abs <= self.equipped_weapon.range &&
         (self.position[1] - enemy.position[1]).abs <= self.equipped_weapon.range
        if @equipped_weapon.is_a?(Grenade)
          @equipped_weapon.hit(enemy)
          @equipped_weapon = nil
        elsif @equipped_weapon
          @equipped_weapon.hit(enemy)
        else
          enemy.wound(@default_attack)
        end
      else
        nil
      end
    else
      raise MyError
    end
  end

end
