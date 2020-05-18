class BloodOath

    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        # cult.recruit_follower(follower)

        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all[0]
    end


end