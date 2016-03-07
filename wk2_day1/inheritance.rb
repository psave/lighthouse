module Flight
  def fly
    #How should I return the values?
    return "I'm a #{self.class.to_s}, I'm flying!"
  end
end


class Animal

  def warm_blooded

  end
end

class Mammal < Animal
end


class Amphibian < Animal
  @swims = true
end

class Primate < Animal
  @num_legs = 2
end

class Frog < Amphibian
  def jumps(jumps)
    jump_height = 2
  end
end

class Bat < Amphibian
  include Flight
  #how should I assign the name?
  @wings = 2
end

class Bird
  include Flight
end

class Parrot
  include Flight
end

class Chimpanzee < Primate
end


bat1 = Bat.new
parrot1 = Parrot.new
puts bat1.fly
puts parrot1.fly



