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


end
