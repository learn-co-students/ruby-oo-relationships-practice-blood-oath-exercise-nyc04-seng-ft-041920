class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower, initiation_date)
        BloodOath.new(follower, self, initiation_date)
    end

    def get_followers
        BloodOath.all.collect do |oath|
            if oath.cult == self
                oath.follower
            end
        end.compact
    end

    def cult_population
        self.get_followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.founding_year == year}
    end

    def average_age
        ages = self.get_followers.collect {|follower| follower.age}
        ages.sum(0.0) / ages.length
    end

    def my_followers_mottos
        mottos = self.get_followers.collect {|follower| follower.life_motto}
        mottos.each {|motto| puts motto}
    end

    def self.least_popular
        self.all.min_by {|cult| cult.cult_population}
    end

    def self.most_common_location
        locations = self.all.collect {|cult| cult.location}
        tally = locations.each_with_object(Hash.new(0)) {|location, counts| counts[location] +=1}
        tally.sort_by {|k, v| -v}.flatten[0]
    end
end