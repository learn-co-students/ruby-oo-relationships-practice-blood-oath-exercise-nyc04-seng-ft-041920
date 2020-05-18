class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all 
    end

    def join_cult(cult_instance)
        BloodOath.new(cult_instance, self)
    end

    def bloodoaths 
        BloodOath.all.find_all {|bloodoath| bloodoath.follower == self}
    end

    def cults 
        self.bloodoaths.collect {|bloodoath| bloodoath.cult}
    end

    def self.of_a_certain_age(num)
        self.all.find_all {|follower| follower.age >= num}
    end

    def my_cults_slogans
        self.cults.collect {|cult| cult.slogan}
    end

    def self.most_active
        followers_arr = BloodOath.all.collect {|bloodoath| bloodoath.follower}
        followers_arr.max_by {|follower| followers_arr.count(follower)}
    end

    def self.top_ten
        followers_arr = BloodOath.all.collect {|bloodoath| bloodoath.follower}
        followers_arr.max_by(10) {|follower| followers_arr.count(follower)}
    end

end