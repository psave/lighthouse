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
    @siege_engine1 = SiegeEngine.new
    @siege_engine2 = SiegeEngine.new
    @barracks = Barracks.new
    @footman = Footman.new
    @peasant = Peasant.new
  end

  it "starts off with 400 gold resources" do
    expect(@siege_engine1.gold).to eq(400)
  end

  it "starts off with 3 food resources" do
    expect(@siege_engine1.food).to eq(3)
  end

  it "starts off with 400 hit points" do
    expect(@siege_engine1.hp).to eq(400)
  end

  it "starts off with 60 lumber resources" do
    expect(@siege_engine1.lumber).to eq(60)
  end

  it "starts off with 60 lumber resources" do
    expect(@siege_engine1.lumber).to eq(60)
  end

#SiegeEngine can not attack footmen, because they are units
  it "if the enemy is a footman, the seige engine can not attack" do
    expect(@siege_engine1.can_attack?(@footman)).to eq(false)
  end

#SiegeEngine can not attack peasants, becaue they are units
  it "if the enemy is a peasant, the seige engine can not attack" do
    expect(@siege_engine1.can_attack?(@peasant)).to eq(false)
  end

#SiegeEngines can attack other SiegeEngines
  it "if the enemy is another SiegeEngine, the seige engine can attack" do
    expect(@siege_engine1.can_attack?(@siege_engine2)).to eq(true)
  end

# When SiegeEngine can attack Barracks it attacks with 2X ap
  describe "#attack!" do
    it "should do deal 2X attack power when attacking an enemy Barracks" do
      expect(@barracks).to receive(:damage).with(100) #should be 2X the number of attack points.
      @siege_engine1.attack!(@barracks)
    end
  end

# When SiegeEngine can attack Barracks it receives 2X the ap of the SiegeEngine
  describe "#damage" do
    it "should reduce the barracks's health_points by the attack_power specified" do
      @barracks.damage(100)
      expect(@barracks.hp).to eq(400)
    end
  end

# When a SiegeEngine attacks another SiegeEngine it attacks with regular ap
  describe "#attack!" do
    it "should do deal regular attack power when attacking an enemy SiegeEngine" do
      expect(@siege_engine2).to receive(:damage).with(50)
      @siege_engine1.attack!(@siege_engine2)
    end
  end

# When a SiegeEngine is attacked another SiegeEngine it recieves damage equal to the regular ap
# of the attacking SiegeEngine
  describe "#damage" do
    it "should reduce the enemy SiegeEngines's health_points by the attack_power specified" do
      @siege_engine2.damage(50)
      expect(@siege_engine2.hp).to eq(350)
    end
  end


end