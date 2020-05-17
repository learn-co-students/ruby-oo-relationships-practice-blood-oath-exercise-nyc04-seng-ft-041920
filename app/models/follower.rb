class Follower
  attr_reader :name, :age, :motto

  @@all = []

  def initialize(name, age, motto)
    @name = name
    @age = age
    @motto = motto
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(int)
    self.all.select {|sheep| sheep.age >= int}
  end

  def cults
    # you can grab the initiation date, or the cult, or the follower
    BloodOath.all.select {|cult| cult.follower == self}
  end

  def join_cult(cult)
    BloodOath.new("#{Time.now}", cult, self)
  end

end
