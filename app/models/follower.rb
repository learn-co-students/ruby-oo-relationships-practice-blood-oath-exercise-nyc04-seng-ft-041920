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

  def my_cults_slogans
    cults.collect {|cult| cult.cult.slogan}
  end

  def self.most_active
    # why not throw them into a new array using cults?
    arr = BloodOath.all.collect {|person| person.follower}
    arr.max_by {|person| arr.count(person)}
  end

  def self.top_ten
    # returns an Array of followers; they are the ten most active followers
    # did it want instance
    arr = self.all.max(10){|person| person.cults.length}
    # or did it want the name of each person, in the array?
    arr.collect {|name| name.name}
  end
end
