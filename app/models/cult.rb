class  Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        self.class.all << self
    end

    def self.all
        @@all
    end
    
    # def self.find(var)
    #     self.all.select{|cult| cult.${var} == var}
    # end

    def self.find_by_name(name)
        self.all.find{ |cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{ |cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select{ |cult| cult.founding_year == year}
    end

    def recruit_follower(follower)
        BloodOath.new(follower,self)
    end

    #return related Blood Oath with cult
    def blood_oath
        BloodOath.all.select{|blood_oath| blood_oath.cult == self}
    end

    #return related followers with called Cult
    def followers
        blood_oath.map{|blood_oath| blood_oath.follower}
    end

    def cult_population
        followers.size
    end

    def average_age
        sum = followers.reduce(0){|sum, follower| sum += follower.age}
        sum/self.cult_population
    end

    def my_followers_mottos
        followers.each{|follower| pp follower.life_motto}
    end

    def self.least_popular
        self.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
        
        ##1.make location array and count value inside
        # locations = self.all.map{|cult| cult.location}
        # locations.max_by{|loc| locations.count(loc)}
        
        ##2.shorten version with Ruby 2.7.0 using tally you can
        ##create hash with array
        #locations = self.all.map{|cult| cult.location}.tally
        #locations.max_by{|loc| locations.count(loc)}
        
        ##3.create hash and get max
        # location = {}
        # self.all.each do |cult| 
        #     if location[cult.location]
        #         location[cult.location] += 1
        #     else
        #         location[cult.location] = 1
        #     end
        # end
        # location.max_by{ |k, v| v }


        #############what if there are 2 same count location? Why is it getting only one???????
        
        ##get most counted number of location
        cycle = 0
        locations = self.all.map{|cult| cult.location}
        uniq_loc = locations.uniq
        uniq_loc.each do |loc| 
            if cycle <locations.count(loc)
                cycle = locations.count(loc)
            else
                cycle
            end
        end
        
        ##create hash with location and value
        location = {}
        
        self.all.each do |cult| 
            if location[cult.location]
                location[cult.location] += 1
            else
                location[cult.location] = 1
            end
        end        

        ##check if there is more the one of max cycle return array
        location.select{|k,v| location[k] == cycle}.keys.join(",")


    end



end