require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#  def initialize(name, location, founding_year, slogan, followers = [])
c1 = Cult.new("Cult", "NYC", 2020, "this is weird")
c2 = Cult.new("Cult2", "NYC", 2021, "blahblah")
c3 = Cult.new("Cult3", "NYC", 2023, "ugh")


#  def initialize(name, age, life_motto)
f1 = Follower.new("Senada", 23, "idk whats happening")
f2 = Follower.new("Jim", 50, "howdy")

# def initialize(initiation_date, cult, follower)
oath1 = BloodOath.new("2020-01-01", c1, f1)
oath2 = BloodOath.new("2020-01-02", c1, f2)
oath3 = BloodOath.new("2020-01-01", c2, f1)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits