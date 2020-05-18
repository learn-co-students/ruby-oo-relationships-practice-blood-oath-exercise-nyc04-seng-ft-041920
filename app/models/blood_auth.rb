class BloodAuth 

        @@all = []

        attr_reader :initiation_date, :cult, :follower
        #initiation_date (YYYY-MM-DD), cult instance, follower instance 
        def initialize(initiation_date, cult, follower)
            @initiation_date = initiation_date
            @cult = cult 
            @follower = follower 

            @@all << self 
        end 

        def self.all 
            @@all 
        end

        def self.first_oath 
            self.all.first.follower   
        end 
        
end 