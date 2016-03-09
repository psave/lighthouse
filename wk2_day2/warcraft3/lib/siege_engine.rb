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




end