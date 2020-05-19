require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("name1", "location1", 2005, "slogan1")
cult2 = Cult.new("name2", "location2", 2005, "slogan2")
cult3 = Cult.new("name3", "location1", 2004, "slogan3")

follower1 = Follower.new("follower1", 30, "life_motto1")
follower2 = Follower.new("follower2", 31, "life_motto2")
follower3 = Follower.new("follower3", 32, "life_motto3")

# (follower1, cult1, "2005-02-05")
bo2 = BloodOath.new(follower1, cult2, "2005-03-06")
bo3 = BloodOath.new(follower3, cult1, "2005-02-05")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
