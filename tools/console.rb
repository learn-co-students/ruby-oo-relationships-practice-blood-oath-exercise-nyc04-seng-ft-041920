require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# In an attempt to not get doxxed by

# cults
ham = Cult.new("Humans Against Monsters", "Abandoned Mine", 1869, "Cor blimey, mate! What are ye doing in me pockets?") # 169 in the Fifth Age
trinity = Cult.new("Trinity", "Yamatai Island", 978, "...then blood it shall be") # much longer than that
solarii = Cult.new("Solarii", "Yamatai Island", 1980, "Brotherhood of the Sun")
project_mayhem = Cult.new("Project Mayhem", "Paper Street House", 1996, "You don't ask questions about Project Mayhem.")

# Followers
robert_paulson = Follower.new("Robert Paulson", 45, "His name was Robert Paulson.")
lara_croft = Follower.new("Lara Croft", 30, "The extraordinary is in what we do, not who we are.")
sliske = Follower.new("Sliske", 23, "Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?")

Cult.find_by_name("Trinity")

# why couldn't we call this a blood tithe
bo1 = BloodOath.new("2003-04-20", trinity, lara_croft)
bo2 = BloodOath.new("2000-03-18", solarii, lara_croft)
bo3 = BloodOath.new("2005-11-27", project_mayhem, robert_paulson)
bo4 = BloodOath.new("2020-03-29", ham, sliske)

lara_croft.join_cult(ham)
trinity.recruit_follower(sliske)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
