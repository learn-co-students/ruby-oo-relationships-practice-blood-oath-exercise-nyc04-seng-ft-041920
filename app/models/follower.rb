class Follower

    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.filter_map{|follower| follower.age >= age}
    end


    def cults
        BloodOath.all.select{|blood_oath| blood_oath.follower == self}
    end

    def join_cult(cult)
        BloodOath.new(self,cult)
    end

    def my_cults_slogans
        cults.select{|cult| cult.slogan}
    end

    def self.most_active
        self.all.max{|a,b| a.cults.size <=> b.cults.size}
    end

    def self.top_ten
        self.all.max(10){|a,b| a.cults.size <=> b.cults.size}
    end
end