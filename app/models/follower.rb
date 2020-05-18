class Follower 

    @@all = []
    attr_reader :name, :age, :life_motto

    #name, age(Integer), life_motto(string)
    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @life_motto = life_motto

        @@all << self 
    end 

    def cults
        BloodAuth.all.map{|blood_auth| blood_auth.follower == self ? blood_auth.cult : nil}.compact 
    end 

    def join_cult(cult)
        BlooadAuth.new("06/04/2018", cult, self)
    end 

    def self.all 
        @@all 
    end 

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age }
    end 

    def my_cults_slogans 
        self.cults.each do |cult|
            puts cult.slogan 
        end 
    end 

    def self.most_active 
        self.all.sort_by{ |follower| follower.cults.count}.last  
    end 

    def self.top_ten 
        sorted_arr = self.all.sort_by{ |follower| follower.cults.count}
        sorted_arr[0, 10] #returns the first 10 
    end 

    #bonus methods 

    #helper method to get the blood auth associated with this follower
    def blood_auths 
        BloodAuth.all.select{|blood_auth| blood_auth.follower == self}
    end 
 

    def fellow_cult_members 
        common_followers = []
        self.cults.each do |my_cult|  
           followers = BloodAuth.all.map{|ba| ba.cult == my_cult && ba.follower != self ? ba.follower : nil}.compact.uniq
           (common_followers << followers).flatten! 
        end 
        common_followers.uniq
    end 

end 