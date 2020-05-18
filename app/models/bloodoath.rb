class BloodOath
    attr_reader :date, :cult, :follower
    
    @@all = []

    def initialize(cult, follower)
        @date = Time.now
        @cult = cult 
        @follower = follower

        @@all << self
    end

    def self.all
        @@all
    end


end