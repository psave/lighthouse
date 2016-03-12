# Create a new instance method in the Robot class called heal!. 
# This method will be slightly different than the previously defined heal 
# (without a bang) method, in that this one is more aggressive in how it behaves.

# Robot #heal! should raise an exception if the robot is already at 0 health 
# or less. In other words, once a robot is dead, it cannot be revived.

require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal" do
    it "not be able to heal a robot if it has @health <= 0" do
      @robot.instance_variable_set(:@health, 0)
      expect { @robot.heal(5) }.to raise_error(MyError, "Can not heal when health is 0 or below")
    end
  end
end