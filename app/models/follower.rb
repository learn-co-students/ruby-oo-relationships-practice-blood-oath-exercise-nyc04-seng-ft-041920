class Follower

    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name                # Creates Name for Follower
        @age = age                  # Creates Age for Follower
        @life_motto = life_motto    # Creates Life Motto for Follower

        @@all << self               # Shovels self into @@all
    end

    # Takes all bloodoaths the current follower has
    def follower_bloodoaths
        BloodOath.all.select{|bloodoath|    
            bloodoath.follower == self
        }
    end

    # Takes all of the cults the current follower is in
    def cults
        follower_bloodoaths(&:cult)
    end

    # Current Follower joins the given cult name
    def join_cult(cult)
        if follower_bloodoaths.detect{|oath| oath.cult == cult}
            "The cult #{cult.name}, already has #{self.name}"
        else
            BloodOath.new(Time.now.strftime("%Y/%d/%m"), cult, self)
        end
    end

    # Returns an array of all instances of <Class :: Follower>
    def self.all
        @@all 
    end

    # Returns all followers that are equal to or greater than the supplied age
    def self.of_a_certain_age(age)
        self.all.select{|follower|
            follower if follower.age  >= age
        }
    end
end