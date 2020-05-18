class Cult 

    @@all = []

    attr_reader :name, :location, :founding_year, :slogan 
    #name, city, year(integer), slogan
    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location
        @founding_year = founding_year 
        @slogan = slogan 

        @@all << self 
    end 

    def recruite_follower(follower)
        BloodAuth.new("05/05/1996", self, follower)
    end 

    def self.all 
        @@all 
    end

    def cult_population
       BloodAuth.all.reduce(0){|total, blood_auth| blood_auth.cult == self ? total +1 : total}
    end  

    def self.find_by_name(cult_name)
        self.all.find{|cult| cult.name == cult_name}
    end 

    def self.find_by_location(cult_location)
        self.all.select{|cult| cult.location == cult_location}
    end 


    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end 

    #helper method that returns all the oaths of this cult 
    def blood_auths 
        BloodAuth.all.select{|blood_auth| blood_auth.cult == self}
    end 

    def average_age 
        self.blood_auths.reduce(0){|sum, blood_auth| sum + blood_auth.follower.age }.to_f / self.blood_auths.size 
    end 

    def my_followers_mottos
        self.blood_auths.each{|blood_auth| puts blood_auth.follower.life_motto}
    end 

    def self.least_popular 
        self.all.min{|a,b| a.cult_population <=> b.cult_population}
    end 

    def self.most_common_location 
        locations = {}
        self.all.each do |cult|
            locations[cult.location] ? locations[cult.location] += 1 : locations[cult.location] = 1   
        end 
        locations.sort_by{|key, value| value}.last[0]  
    end 
end 