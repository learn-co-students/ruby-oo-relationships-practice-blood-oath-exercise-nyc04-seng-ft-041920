class Follower
  attr_reader :name, :age, :life_motto

  @@all_followers = []

  def initialize name, age, life_motto
    @name = name
    @age = age
    @life_motto = life_motto

    @@all_followers << self
  end

  def all_blood_oaths
    BloodOath.all.select { |b_ins| b_ins.follower == self }
  end

  def cults
    self.all_blood_oaths.collect { |b_ins| b_ins.cult}
  end

  def join_cult initiation_str, cult_ins
# - `Follower#join_cult`
#   - takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
#   - NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
#     - do not let them join the cult
#     - print out a friendly message informing them that they are too young
    if self.age > cult_ins.minimum_age
      BloodOath.new(initiation_str, self, cult_ins)
    else
      print "Sorry too young to join this cult"
    end

  end

  def self.all
    @@all_followers
  end

  def self.of_a_certain_age age
    @@all_followers.select do |b_ins|
      # binding.pry
      b_ins.age >= age
    end
  end

  def my_cults_slogans
#   - prints out all of the slogans for this follower's cults
# we can use the cults Instance method because we are inside of an instance method, what I did is call it on 'self' explecitly. so we have the array of all the cults that the current follower instance. I used the collect method to return a new array of only the cults slogans.
    self.cults.collect { |cult_ins| cult_ins.slogan}
  end

  def self.most_active
  #   - returns the `Follower` instance who has joined the most cults
  most_active_follower = @@all_followers.max_by { |follower_ins| follower_ins.cults.count }
  most_active_follower
    # binding.pry
  end

  def self.top_ten
  #   - returns an `Array` of followers; they are the ten most active followers

  # we use the same logic as the most_active method, in this case we can pass a arg into the max_by method wich accepts a number of the top highest values
    @@all_followers.max_by(10) { |follower_ins| follower_ins.cults.count }
  end

  def fellow_cult_members
  #- returns a unique `Array` of followers who are in the same cults as you
  # first I used the cults instance method to get all the cults this instance is in,
  # i used the collect method to collect all followers from those cults, Then i assign it to a local var.
    all_followers_in_the_same_cult = self.cults.collect do |cult_ins|
      cult_ins.all_followers
    end

    # I used the flatten method to take make it into one array and then the select method that returns a new array and checks for followers who are not the instance calling.

    # at the end i chained a uniq method to take away any duplicates
    all_followers_in_the_same_cult.flatten.select { |follower_ins| follower_ins != self}.uniq
    # binding.pry
  end

end

# **`Follower`**

# - `Follower#name`
#   - returns a `String` that is the follower's name
# - `Follower#age`
#   - returns an `Integer` that is the age of the follower
# - `Follower#life_motto`
#   - returns a `String` that is the follower's life motto
# - `Follower#cults`
#   - returns an `Array` of this follower's cults
# - `Follower#join_cult`
#   - takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
# - `Follower.all`
#   - returns an `Array` of all the followers
# - `Follower.of_a_certain_age`
#   - takes an `Integer` argument that is an age and returns an `Array` of followers who are the given age or older

# **`Follower`**

# - `Follower#my_cults_slogans`
#   - prints out all of the slogans for this follower's cults
# - `Follower.most_active`
#   - returns the `Follower` instance who has joined the most cults
# - `Follower.top_ten`
#   - returns an `Array` of followers; they are the ten most active followers

# BONUS********
# - `Follower#fellow_cult_members`
#   - returns a unique `Array` of followers who are in the same cults as you
