class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        # cults = []
        # BloodOath.all.each do |oath|
        #     cults << oath.cult if oath.follower == self
        # end
        # cults

        BloodOath.all.map do |oath|
            if oath.follower == self
                oath.cult
            end
        end.compact

    end

    def join_cult(cult)
        # def initialize(initiation_date, cult, follower)
        BloodOath.new("2020-01-01", cult, self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.map {|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.each do |cult|
            p cult.slogan
        end
    end

    def self.most_active
        self.all.max_by { |follower| follower.name }
    end

    def self.top_ten
        self.all.max_by(10) { |follower| follower.name }
    end

end