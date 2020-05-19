class Cult
  attr_reader :name, :location, :founding_year, :slogan, :followers

  @@all_cults = []

  def initialize cult_name, cult_location, cult_year, cult_slogan
    @name = cult_name
    @location = cult_location
    @founding_year = cult_year
    @slogan = cult_slogan

    @@all_cults << self
  end

  def all_blood_oaths
    BloodOath.all.select { |b_ins| b_ins.cult == self}
  end

  def all_followers
    all_blood_oaths.collect { |b_ins| b_ins.follower}
  end

  def recruit_follower init_date, follower_ins
  #- takes in an argument of a `Follower` instance and adds them to this cult's list of followers
  #   - NOW this is changed such that if the given `Follower` instance is not of age:
  #   - do not let them join the cult
  #   - print out a friendly message informing them that they are too young
    if follower_ins.age > minimum_age
      BloodOath.new(init_date , follower_ins, self)
    else
      puts "Sorry you are too young to join this cult. :("

    end
  end

  def cult_population
    # binding.pry
    self.all_followers.count
  end

  def self.all
    @@all_cults
  end

  def self.find_by_name name_str
    @@all_cults.detect { |cult_ins| cult_ins.name == name_str}
  end

  def self.find_by_location location_str
    @@all_cults.select { |cult_ins| cult_ins.location == location_str}
  end

  def self.find_by_founding_year year_int
    @@all_cults.select { |cult_ins| cult_ins.founding_year == year_int}
  end

  def average_age
    # returns a `Float` that is the average age of this cult's followers
    # binding.pry
    count_followers = self.cult_population

    sum_of_age = self.all_followers.reduce(0) { |sum, follower_ins| sum += follower_ins.age }

    sum_of_age.to_f / count_followers.to_f
  end

  def my_followers_mottos
  # prints out all of the mottos for this cult's followers
  self.all_followers.collect { |follower_ins| follower_ins.life_motto }
  end

  def self.least_popular
  #   - returns the `Cult` instance who has the least number of followers :(
    # binding.pry
    oath_min_cult = BloodOath.all.min_by { |oath_ins| oath_ins.cult.cult_population }
    oath_min_cult.cult

  end

  def self.most_common_location
  #   - returns a `String` that is the location with the most cults

  # This one was bit tricky. first i need it to find the most common location using, created a local var  hash_dups and assign it a hash with 0 in argument so i can increment it when i find a duplicate.
  hash_dups = Hash.new(0)

# we iterate the Class var @@all_cults with the each method, and we start creating key, value pairs, {"location" : 1, "location" : 2}. we increment if location is there,
  @@all_cults.each { |cult_ins| hash_dups[cult_ins.location] += 1}

  # we create a local var to assign it the max value in hash_dups. Using the max_by it returns a new array with the highest key, value pair ["location", num_dups]
  location_most_common_arr = hash_dups.max_by { |location_str, num| num }

  # we return the first element in that array since it is the location string.
  location_most_common_arr[0]

  # binding.pry

  end

  def minimum_age
  # - returns an `Integer` that is the minimum age required for followers joining this cult
    17
  end



end

# **`Cult`**

# - `Cult#name`
#   - returns a `String` that is the cult's name
# - `Cult#location`
#   - returns a `String` that is the city where the cult is located
# - `Cult#founding_year`
#   - returns an `Integer` that is the year the cult was founded
# - `Cult#slogan`
#   - returns a `String` that is this cult's slogan
# - `Cult#recruit_follower`
#   - takes in an argument of a `Follower` instance and adds them to this cult's list of followers
# - `Cult#cult_population`
#   - returns an `Integer` that is the number of followers in this cult
# - `Cult.all`
#   - returns an `Array` of all the cults
# - `Cult.find_by_name`
#   - takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
# - `Cult.find_by_location`
#   - takes a `String` argument that is a location and returns an `Array` of cults that are in that location
# - `Cult.find_by_founding_year`
#   - takes an `Integer` argument that is a year and returns all of the cults founded in that year

# **`Cult`**
# - `Cult#average_age`
#   - returns a `Float` that is the average age of this cult's followers
# - `Cult#my_followers_mottos`
#   - prints out all of the mottos for this cult's followers
# - `Cult.least_popular`
#   - returns the `Cult` instance who has the least number of followers :(
# - `Cult.most_common_location`
#   - returns a `String` that is the location with the most cults

# **`Bonus`**
# - `Cult#minimum_age`
#   - returns an `Integer` that is the minimum age required for followers joining this cult
# - `Cult#recruit_follower`
#   - takes in an argument of a `Follower` instance and adds them to this cult's list of followers
#   - NOW this is changed such that if the given `Follower` instance is not of age:
#     - do not let them join the cult
#     - print out a friendly message informing them that they are too young


