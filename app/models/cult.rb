require_relative 'bloodoath.rb'
require_relative 'follower.rb'

class Cult
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location 
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower_instance)
        BloodOath.new(self, follower_instance)
    end

    #added method that returns all instances of followers of this cult
    def followers 
        BloodOath.all.find_all {|bloodoath| bloodoath.cult == self}.uniq
    end

    def cult_population
        self.followers.count
    end

    def self.find_by_name(cult_name)
        self.all.find_all {|cult| cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        self.all.find_all {|cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(year)
        self.all.find_all {|cult| cult.founding_year == year}
    end
end

teamrocket = Cult.new("Team Rocket", "Kanto", 1996, "To protect the world from devastation")
mlm = Cult.new("Multi Level Marketing Company", "Worldwide", 1920, "hey hun")

jesse = Follower.new("Jesse", 20, "Prepare for trouble")
james = Follower.new("James", 20, "And make it double")
meowth = Follower.new("Meowth", 10, "That's right!")
hun = Follower.new("Hunbot", 30, "*insert emoji*")

teamrocket.recruit_follower(jesse)
teamrocket.recruit_follower(james)
teamrocket.recruit_follower(meowth)

mlm.recruit_follower(hun)

# pp BloodOath.all

# pp mlm.cult_population

# pp Cult.find_by_founding_year(1920)

# pp hun.cults

pp Follower.of_a_certain_age(30)
