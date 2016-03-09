class Unit

  attr_accessor :hp, :ap

  def initialize(hp, ap)
    @hp = hp
    @ap = ap
  end

  def health_points
    return hp
  end

  def dead?
    @hp <= 0
  end

  def attack!(enemy)
    if !enemy.dead? && !self.dead?
      if enemy.instance_of?(Barracks)
        enemy.damage((@ap/2.0).ceil)
      else
        enemy.damage(@ap)
      end
    else
      false
    end
  end

  def damage(ap)
    @hp -= ap
  end

end
