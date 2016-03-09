class SiegeEngine

  attr_reader :ap
  attr_accessor :gold, :food, :hp, :lumber

  def initialize(gold=400, food=3, hp=400, ap=50, lumber=60)
    @ap = ap
    @hp = hp
    @gold = gold
    @lumber = lumber
    @food = food
  end

  def can_attack?(enemy)
    !enemy.is_a?(Unit) #Is not in the class Unit
  end

  def attack!(enemy)
    if can_attack?(enemy)
      if enemy.instance_of?(Barracks)
        enemy.damage(@ap*2)
      else
        enemy.damage(@ap)
      end
    else
      false
  end

  def damage(ap)
    @hp -= ap
  end

  # def attack!(enemy)
  #   if !enemy.dead? && !self.dead?
  #     if enemy.instance_of?(Barracks)
  #       enemy.damage((@ap/2.0).ceil)
  #     else
  #       enemy.damage(@ap)
  #     end
  #   else
  #     false
  #   end
  end

end