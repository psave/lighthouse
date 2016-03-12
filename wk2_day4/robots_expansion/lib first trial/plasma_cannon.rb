class PlasmaCannon < Weapon

  attr_reader :name, :weight, :damage

  def initialize
    super('Plasma Cannon', 200, 55)
  end
  
  def hit(robot)
    robot.wound(damage)
  end

end