require_relative 'spec_helper'

# Enhancement 1
# In most strategy games, like Warcraft III, buildings can also be attacked by Units. 
# Since a Barracks is a building, it has substantially more HP (500). 
# Additionally, a Footman does only half of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

# The damage amount should be an integer (Fixnum), but 
# the ceiling (ceil) of the division should be used as the resulting amount.

describe Barracks do
  before :each do 
    @barracks = Barracks.new
  end

    it "has and knows its HP, which is equal to 500" do
    expect(@barracks.hp).to eq(500)
  end
end

describe Unit do

  before :each do
    @unit = Unit.new(100, 25)
    @enemy = Barracks.new
  end

  describe "#attack!" do
    it "should do deal 1/2 damage to an enemy Barracks" do
      expect(@enemy).to receive(:damage).with(13) #should be 1/2 the number of attack points.
      @unit.attack!(@enemy)
    end
  end

  describe "#damage" do
    it "should reduce the barracks's health_points by the attack_power specified" do
      @enemy.damage(5)
      expect(@enemy.hp).to eq(495) # starts at 500 #it is 1/2 the regular damage of 10
    end
  end

end

