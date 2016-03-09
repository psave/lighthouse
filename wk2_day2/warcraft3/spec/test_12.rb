require_relative 'spec_helper'

# Enhancement 2
# Units start off alive but they die if their HP hits 0 or lower. 
# This is usually a result of receiving damage from combat.

# Define a method #dead? on the Unit class. 
# We add it to Unit instead of Footman because all Units can die, 
# not just Footmans or Peasants.

describe Unit do
  before :each do 
    @unit = Unit.new(0, 10)
  end

    it "if it is dead, the value should return true" do
    expect(@unit.dead?).to eq(true)
  end
end