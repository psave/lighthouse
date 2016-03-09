require_relative 'spec_helper'

# Aside from gold and food, there is also the concept of lumber. 
# Add lumber as a resource that a Barracks can handle.

# A Barracks starts off with 500 lumber.

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 1000 gold resources" do
    expect(@barracks.gold).to eq(1000)
  end

  it "starts off with 80 food resources" do
    expect(@barracks.food).to eq(80)
  end

  it "starts off with 500 hit points" do
    expect(@barracks.hp).to eq(500)
  end

  it "starts off with 500 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

end