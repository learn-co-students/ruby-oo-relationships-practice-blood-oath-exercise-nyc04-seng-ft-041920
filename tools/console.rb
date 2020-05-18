require('pry')
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult01 = Cult.new("CM", "TX", "1980", "blood shower")
cult02 = Cult.new("YOGI", "AR", "1985", "labor camp")
cult03 = Cult.new("COR", "TX", "2020", "spread the virus")
cult04 = Cult.new("GB", "CA", "1970", "creepy")
cult05 = Cult.new("Highway", "TX", "1995", "Kidnap it all")
cult06 = Cult.new("COR", "AR", "2020", "poisonus life")
# cult07 = Cult.new("NEW", "AR", "2020", "poisonus mind")

follower01 = Follower.new("AA", 19, "life suckes")
follower02 = Follower.new("BB", 22, "sick of everything")
follower03 = Follower.new("CC", 41, "what\'s the point")
follower04 = Follower.new("DD", 35, "looking for a change")
follower05 = Follower.new("EE", 55, "who cares i wanna go out")

follower01.join_cult(cult01)
follower01.join_cult(cult02)

follower02.join_cult(cult01)
follower02.join_cult(cult02)

follower03.join_cult(cult01)
follower04.join_cult(cult02)

follower05.join_cult(cult03)

cult02.recruit_follower(follower03)

binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits