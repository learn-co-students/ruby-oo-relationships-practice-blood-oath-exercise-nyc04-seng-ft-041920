class BloodOath
    attr_reader :date, :cult, :follower
    
    @@all = []

    def initialize(cult, follower)
        @date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @cult = cult 
        @follower = follower

        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all[0].follower
    end


end