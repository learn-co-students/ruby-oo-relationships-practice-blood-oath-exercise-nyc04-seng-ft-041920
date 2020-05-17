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
waystar_royco = Cult.new("Waystar Royco", "Manhattan", 1985, "We hear for you.")
sic_mundus = Cult.new("Sic Mundus", "Winden", 1921, "Sic Mundus Creatus Est")


# Followers -- went from cult to cult classics oh god help send help
robert_paulson = Follower.new("Robert Paulson", 45, "His name was Robert Paulson.")
lara_croft = Follower.new("Lara Croft", 30, "The extraordinary is in what we do, not who we are.")
sliske = Follower.new("Sliske", 23, "Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?")
zamorak = Follower.new("Zamorak", 16, "My philosophy is 'strength from chaos and adversity'.")
jian_yang = Follower.new("Jian-Yang", 21, "What if I told you there is an app on the market...")
logan_roy = Follower.new("Logan Roy", 70, "F*ck off")
mikkel_nielsen = Follower.new("Mikkel Nielsen", 12, "Die frage ist nicht wo, sondern wann")
izet = Follower.new("Izet Fazlinovic", 76, "Sunce ti kalajsano!")
carmela = Follower.new("Carmela Soprano", 34, "Is there a commandment against eating ziti?")
tom_wambsgans = Follower.new("Tom Wambsgans", 32, "YOU CAN'T MAKE A TOMLETTE WITHOUT BREAKING A FEW GREGGS!")

Cult.find_by_name("Trinity")

# remember to leave solarii as the only cult with 1 member
# SOLARII
bo2 = BloodOath.new("2000-03-18", solarii, lara_croft)

# TRINITY
trinity.recruit_follower(sliske)
bo1 = BloodOath.new("2003-04-20", trinity, lara_croft)
jian_yang.join_cult(trinity)


# Ham
bo4 = BloodOath.new("2020-03-29", ham, sliske)
zamorak.join_cult(ham)
lara_croft.join_cult(ham)
jian_yang.join_cult(ham)

# project mayhem
bo3 = BloodOath.new("2005-11-27", project_mayhem, robert_paulson)
jian_yang.join_cult(project_mayhem)

# waystar royco
jian_yang.join_cult(waystar_royco)
logan_roy.join_cult(waystar_royco)
tom_wambsgans.join_cult(waystar_royco)
izet.join_cult(waystar_royco)
carmela.join_cult(waystar_royco)

#sic mundus
jian_yang.join_cult(sic_mundus)
mikkel_nielsen.join_cult(sic_mundus)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
