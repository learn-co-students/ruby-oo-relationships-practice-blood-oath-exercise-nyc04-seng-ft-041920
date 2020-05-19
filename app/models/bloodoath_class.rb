class BloodOath
  attr_reader :initiation_date, :follower, :cult

  @@all_bloodoaths = []

  def initialize initiation_date, follower_obj, cult_obj
    @initiation_date = initiation_date
    @follower = follower_obj
    @cult = cult_obj

    @@all_bloodoaths << self
  end

  def self.all
    @@all_bloodoaths
  end

  def self.first_oath
    @@all_bloodoaths[0]
  end

end


# **`BloodOath`**

# - `BloodOath#initiation_date`
#   - returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.
# - `BloodOath.all`
#   - returns an `Array` of all the blood oaths

# **`BloodOath`**

# - `BloodOath.first_oath`
#   - returns the `Follower` instance for the follower that made the very first blood oath

