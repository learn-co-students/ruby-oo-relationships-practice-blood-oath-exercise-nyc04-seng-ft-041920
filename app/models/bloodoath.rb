class BloodOath
    attr_reader :date, :cult, :follower
    
    @@all = []

    def initialize(cult, follower)
        @date = "YYYY_ MM_DD" 
        @cult = cult 
        @follower = follower

        @@all << self
    end

    def self.all
        @@all
    end


end