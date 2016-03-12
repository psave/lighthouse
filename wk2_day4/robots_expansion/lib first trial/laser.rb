class Laser < Weapon

  attr_reader :name, :weight, :damage

  def initialize
    super('Laser', 125, 25)
  end

  def hit(robot)
    robot.wound(damage)
  end

end