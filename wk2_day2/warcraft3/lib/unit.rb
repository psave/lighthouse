class Unit

  attr_accessor :hp, :ap

  def initialize(hp, ap)
    @hp = hp
    @ap = ap
  end

  def health_points
    return hp
  end

  def attack!(enemy)
    enemy.damage(@ap)
  end

  def damage(ap)
    @hp -= ap
  end

end
