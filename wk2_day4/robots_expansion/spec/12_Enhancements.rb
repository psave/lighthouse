require_relative 'spec_helper'

# Robot#attack! should raise an exception if the target being attacked 
# is not a robot. A user should not be able to attack an Item 
# or anything other than a Robot.

describe Robot do
  before :each do
    @robot = Robot.new
    @boxofbolts = BoxOfBolts.new
  end

  describe "#attack" do
    it "not be able to attack unless the target being attacked is not a robot" do
      expect{@robot.attack(@boxofbolts)}.to raise_error(MyError)
    end
  end
end