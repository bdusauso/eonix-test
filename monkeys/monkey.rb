Trick = Struct.new(:type, :name)
Performance = Struct.new(:monkey, :trick)

class Monkey
  attr_reader :name, :tricks

  def initialize(name)
    @name = name
    @tricks = [
      Trick.new(:sing, "Foo"),
      Trick.new(:acrobatics, "Bar")
    ]
  end

  def perform
    @tricks
  end
end

class Trainer
  def initialize(monkey)
    @monkey = monkey
  end

  def ask_monkey
    @monkey.perform.map { |t| Performance.new(@monkey, t) }
  end
end

class Spectator
  def react_to_performance(performance)
    monkey = performance.monkey
    trick  = performance.trick
    action = trick.type == :sing ? "applauses" : "booes"

    puts "spectator #{action} while '#{monkey.name}' performs '#{trick.name}'"
  end
end

monkey1 = Monkey.new("Bobo")
monkey2 = Monkey.new("Lolo")

trainer1 = Trainer.new(monkey1)
trainer2 = Trainer.new(monkey2)

spectator = Spectator.new

[trainer1, trainer2].each do |trainer|
  trainer.ask_monkey.each { |performance| spectator.react_to_performance(performance)}
end
