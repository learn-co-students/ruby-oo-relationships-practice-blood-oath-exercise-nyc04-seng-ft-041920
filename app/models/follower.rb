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

    def cults 
        BloodOath.all.find_all {|bloodoath| bloodoath.follower == self}
    end

    def self.of_a_certain_age(num)
        self.all.find_all {|follower| follower.age >= num}
    end

end