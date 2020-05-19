class BloodOath
    attr_accessor :follower, :cult, :initiation_date

    @@all = []

    def initialize(follower, cult, initiation_date)
        @follower = follower
        @cult = cult
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.first_oath
        self.all.sort_by {|oath| oath.initiation_date}.first
    end
end