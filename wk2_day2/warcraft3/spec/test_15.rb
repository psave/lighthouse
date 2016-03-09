require_relative 'spec_helper'

# Enhancement 5

# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against 
# buildings such as the Barracks. However, it is ineffective against other Units. 
# (It can't attack them, as if they were dead.)

# So unlike with Footman (whose attacks do a fraction of the damage they normally would,) 
# a SiegeEngine does 2× damage against a Barracks.

# Also, SiegeEngines can attack other SiegeEngines even though they cannot attack 
# any other Units (such as Peasants or Footmans.)

# SiegeEngines are initialized with these stats.

# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food
# Make note, you will need to require the seige_engine.rb file in spec_helper.rb.

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "starts off with 400 gold resources" do
    expect(@siege_engine.gold).to eq(400)
  end

  it "starts off with 3 food resources" do
    expect(@siege_engine.food).to eq(3)
  end

  it "starts off with 400 hit points" do
    expect(@siege_engine.hp).to eq(400)
  end

  it "starts off with 60 lumber resources" do
    expect(@siege_engine.lumber).to eq(60)
  end

  it "starts off with 60 lumber resources" do
    expect(@siege_engine.lumber).to eq(60)
  end

#SiegeEngine can not attack units

#SiegeEngine can not attack footmen, because they are units

#SiegeEngine can not attack peasants, becaue they are units

# When SiegeEngine can attack Barracks it does 2X damage

#SiegeEngines can attack other SiegeEngines


end