class Cult
  attr_reader :name, :location, :founding_year, :slogan, :minimum_age

  @@all =[]

  def initialize(name, location, founding_year, slogan, minimum_age=20)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    save
  end
# testing the commit
  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(str)
    self.all.select {|cult| cult.name == str}
  end

  def self.find_by_location(str)
    self.all.select {|cult| cult.location == str}
  end

  def self.find_by_founding_year(int)
    self.all.select {|cult| cult.founding_year == int}
  end

  def recruiting_process(lamb)
    BloodOath.new(Time.now.to_s, self, lamb)
  end


  def recruit_follower(lamb)
    lamb.age > self.minimum_age ? self.recruiting_process(lamb) : "NEXT"
  end

  # needed a followers method
  def followers
    BloodOath.all.select {|cult| cult.cult == self}
  end

  def cult_population
    followers.count
  end

  def average_age
    age = followers.collect {|follower| follower.follower.age}
    age.reduce(:+).to_f/age.count
  end

  def my_followers_mottos
    followers.collect {|sacrificial_lamb| sacrificial_lamb.follower.motto}
  end

  def self.least_popular
    # instead of referencing by index
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    arr = self.all.collect {|location| location.location} # arr of locations
    arr.max_by {|place| arr.count(place)} # can have count inside for this
  end

end
