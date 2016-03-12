class Laser < Weapon

  attr_reader :name, :weight, :damage, :range

  def initialize
    super('Laser', 125, 25)
    @range = 1
  end

  def hit(robot)
    robot.wound(damage)
  end

end