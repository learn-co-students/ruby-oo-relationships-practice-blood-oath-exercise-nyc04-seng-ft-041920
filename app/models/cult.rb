class Cult
  attr_reader :name, :location, :founding_year, :slogan

  @@all =[]

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
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

  def recruit_follower(lamb)
    BloodOath.new(Time.now.to_s, self, lamb)
  end

  def cult_population
    BloodOath.all.select {|cult| cult.cult == self}.count
  end

end
