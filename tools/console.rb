require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# def initialize name, age, life_motto
john = Follower.new("John Doe", 20, "YOLO")
nancy = Follower.new("Nancy Perez", 32, "Hey was up?")
mike = Follower.new("Michael cantos", 28, "take advantage each day")
jeff = Follower.new("Jeff Huisa", 25, "soccer is life")
jas = Follower.new("Jasmine Huisa", 20, "soccer is life")
carlos = Follower.new("Carlos Bautista", 41, "soccer is life")
james = Follower.new("James Quispe", 21, "soccer is life")
kevin = Follower.new("Kevin Cantos", 19, "soccer is life")
juan = Follower.new("Juan Ortegon", 18, "soccer is life")
leslie = Follower.new("Leslie Sanches", 23, "soccer is life")
julio = Follower.new("Julio Valencia", 15, "soccer is life")


# def initialize cult_name, cult_location, cult_year, cult_slogan
cult1 = Cult.new("The Church of Scientology", "new jersey", 1952, "science rocks")
cult2 = Cult.new("peoples temple", "indiana", 1955, "people are temples")
cult3 = Cult.new("heaven's gate", "colorado", 1955, "heaven is where i want to go!")
cult4 = Cult.new("Aum Shinrikyo", "Japan", 1984, " known simply as “Aleph”")
cult5 = Cult.new("cool cult", "indiana", 1982, "we are too cool")
cult6 = Cult.new("lame cult", "indiana", 1982, "we are too lame")


# _YYYY-MM-DD_ ### initiation_date, follower_obj, cult_obj
bloodoath1 = BloodOath.new("2019-05-12", john, cult1)
bloodoath2 = BloodOath.new("2002-05-21", jeff, cult3)
bloodoath3 = BloodOath.new("2013-10-05", mike, cult2)
bloodoath4 = BloodOath.new("2014-11-01", nancy, cult3)
bloodoath5 = BloodOath.new("2015-11-06", john, cult3)
bloodoath6 = BloodOath.new("2015-11-06", nancy, cult2)
# bloodoath7 = BloodOath.new("2019-05-12", john, cult2)
# bloodoath8 = BloodOath.new("2019-05-12", kevin, cult5)
# bloodoath9 = BloodOath.new("2015-11-06", james, cult4)
# bloodoath10 = BloodOath.new("2015-11-06", carlos, cult2)
# bloodoath11 = BloodOath.new("2015-11-06", julio, cult1)
# bloodoath12 = BloodOath.new("2015-11-06", leslie, cult2)
# bloodoath13 = BloodOath.new("2014-11-01", jeff, cult5)
# bloodoath14 = BloodOath.new("2014-11-01", juan, cult6)
# bloodoath15 = BloodOath.new("2014-11-01", jeff, cult2)


# Expectation cult2.recruit_follower "2014-12-03", nancy => cult2.all_followers.count == 2

# Expect Follower.most_active ===> <nancy>

# Expect Follower.top_ten ==> [<follower1>, <follower2>, ...]

# Expect nancy.fellow_cult_members => [<john>, <jeff>]





# cult2.recruit_follower nancy

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
