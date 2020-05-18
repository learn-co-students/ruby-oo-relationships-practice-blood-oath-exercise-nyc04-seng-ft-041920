class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        # @followers = followers

        @@all << self
    end

    def recruit_follower(follower)
        # @followers << follower
        # def initialize(initiation_date, cult, follower)
        BloodOath.new("2020-01-01", self, follower)
    end

    def cult_population
        BloodOath.all.count do |bloadoath|
            bloadoath.cult == self
        end
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|cults| cults.name == name }
    end

    def self.find_by_founding_year(year)
        self.all.select {|cults| cults.founding_year == year}
    end

    def self.find_by_location(location)
        self.all.select {|cults| cults.location == location}
    end

    def average_age

    #using the inject method example
    # arr = [5, 6, 7, 8]
    # arr.inject{ |sum, el| sum + el }.to_f / arr.size
    # => 6.5
    ages = []
    BloodOath.all.map do |oath|
        if oath.cult == self
            ages << oath.follower.age
        end
    end
    ages.inject{ |sum, age| sum + age}.to_f / ages.size
    end

    def my_followers_mottos
        BloodOath.all.each do |oath|
            if oath.cult == self
                puts oath.follower.life_motto
            end
        end
    end

    def self.least_popular
    #using .min method to find minimum
    # a = %w(albatross dog horse)
    # a.min { |a, b| a.length <=> b.length }  #=> "dog"

    #because we already have a method that gives us the population of the cults, we can use the min method and call on the cult population method within it, to compare the values and find the minimum

    self.all.min do |a, b| 
        a.cult_population <=> b.cult_population 
    end

    end

    def self.most_common_location
        value = self.all.max_by { |cult| cult.location }
        value.location
    end
end