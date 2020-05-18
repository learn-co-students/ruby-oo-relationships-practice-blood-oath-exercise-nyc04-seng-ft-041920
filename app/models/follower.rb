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

  def application(cult)
    BloodOath.new("#{Time.now}", cult, self)
  end

  def join_cult(cult)
    self.age > cult.minimum_age ? application(cult) : "WE NEED ANOTHER BLOOD SACRIFICE"
  end

  def my_cults_slogans
    cults.collect {|cult| cult.cult.slogan}
  end

  def self.most_active
    arr = BloodOath.all.collect {|person| person.follower}
    arr.max_by {|person| arr.count(person)}
  end

  def self.top_ten
    # did it want instance
    self.all.max(10){|person| person.cults.length}.collect {|name| name.name}
    # or did it want the name of each person, in the array?
  end

  def fellow_cult_members
    # im embarassed but it passes “¯\_(ツ)_/¯“
    all_followers = cults.collect {|bo| bo.cult}.collect {|cult| cult.followers}.flatten
    all_followers.collect {|follow| follow.follower.name}.select {|name| name != self.name}.uniq
  end
end
