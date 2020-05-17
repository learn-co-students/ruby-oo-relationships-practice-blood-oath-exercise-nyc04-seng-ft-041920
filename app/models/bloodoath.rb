class BloodOath
  # LOOK AT DOCTORS - APPOINTMENTS - PATIENTS
  attr_reader :initiation_date, :cult, :follower

  @@all = []

  def initialize(initiation_date, cult, follower)
    # format YYYY-MM-DD.
    @initiation_date = initiation_date
    @cult = cult
    @follower = follower
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    @@all[0].follower
    # because calling all seems to return a sorted list, where it almost remembers who came in first
  end

end
