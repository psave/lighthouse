require_relative 'spec_helper'

# Enhancement 3
# A dead Unit cannot attack another Unit. 
# Conversely, an alive Unit will also not attack another Unit that is already dead.

describe Unit do
  before :each do 
    @unit1 = Unit.new(0, 10)
    @unit2 = Unit.new(1, 10)
  end

# Dead unit can not attack another Unit
    it "if the Unit is dead, the Unit can not attack another unit" do
    expect(@unit1.attack!(@unit2)).to eq(false)
  end
# Alive Unit can not attack a dead Unit
    it "A Unit that is alive can not attack a unit that is dead." do
    expect(@unit2.attack!(@unit1)).to eq(false)
  end

end