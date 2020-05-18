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

    #added method that returns all instances of blood oaths of this cult
    def bloodoaths
        BloodOath.all.find_all {|bloodoath| bloodoath.cult == self}.uniq
    end

    #just the follower instances inside the bloodoaths
    def followers 
        self.bloodoaths.collect {|bloodoath| bloodoath.follower}
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

    def average_age
        total = 0
        self.followers.each {|follower| total += follower.age}
        total/(self.cult_population.to_f)
    end

    def my_followers_mottos
        self.followers.collect {|follower| follower.life_motto}
    end

    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population
        end
    end

    #revisit this
    def self.most_common_location
        locations = self.all.collect {|cult| cult.location}
        locations.max_by{|i| locations.count(i)}
    end
end

teamrocket = Cult.new("Team Rocket", "Kanto", 1996, "To protect the world from devastation")
teamrocket2 = Cult.new("Team Rocket2", "Kanto", 1996, "To protect the world from devastation")
teamrocket3 = Cult.new("Team Rocket3", "Kanto", 1996, "To protect the world from devastation")


mlm = Cult.new("Multi Level Marketing Company", "Worldwide", 1920, "hey hun")
ponzi = Cult.new("Pyramid Scheme", "Worldwide", 1920, "lol")

jesse = Follower.new("Jesse", 20, "Prepare for trouble")
james = Follower.new("James", 20, "And make it double")
meowth = Follower.new("Meowth", 10, "That's right!")
hun = Follower.new("Hunbot", 30, "*insert emoji*")

teamrocket.recruit_follower(jesse)
teamrocket.recruit_follower(james)
teamrocket.recruit_follower(meowth)
teamrocket.recruit_follower(hun)

mlm.recruit_follower(hun)
mlm.recruit_follower(jesse)

pp BloodOath.all

# pp mlm.cult_population

# pp Cult.find_by_founding_year(1920)

# pp hun.cults

# pp Follower.of_a_certain_age(30)

# pp teamrocket.my_followers_mottos

# pp Cult.most_common_location

# pp Follower.top_ten


