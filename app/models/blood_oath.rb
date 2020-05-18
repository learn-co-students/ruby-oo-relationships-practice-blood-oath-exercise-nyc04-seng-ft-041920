class BloodOath

    attr_accessor :follower, :cult
    attr_reader :initiation_date
    @@all = []
    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initiation_date = Time.now
        self.class.all << self
    end

    def self.all
        @@all
    end

    def initiation_date_format
        @initiation_date.strftime("%Y-%m-%d")
    end

    def self.first_oath
        # oath_sort = self.all.sort_by do |blood_oath|
        #     blood_oath.initiation_date
        #   end
        #   #binding.pry
        #   oath_sort[0].follower
        @@all[0].follower
    end

end