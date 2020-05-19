class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        BloodOath.all.collect do |oath|
            if oath.follower == self
                oath.cult
            end
        end.compact
    end

    def join_cult(cult, initiation_date)
        cult.recruit_follower(self, initiation_date)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age == age}
    end

    def my_cult_slogans
        self.cults.each {|cult| puts cult.slogan}
    end

    def self.most_active
        self.all.max_by { |follower| follower.cults.count}
    end

    def self.top_ten
        self.all.max_by(10) { |follower| follower.cults.count}
    end
end