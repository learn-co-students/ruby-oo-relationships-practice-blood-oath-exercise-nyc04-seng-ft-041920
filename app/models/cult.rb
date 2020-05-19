class Cult

    attr_reader :name, :location, :founding_year, :slogan
    @@all = []  # Class Array

    def initialize(name, location, founding_year, slogan)
        @name = name                        # Creates Name for Cult
        @location = location                # Creates Location for Cult
        @founding_year = founding_year      # Creates Founding Year for Cult
        @slogan = slogan                    # Creates Slogan for Cult

        @@all << self                       # Shovels new instance into @@all
    end

    # Gathers all Cults
    def self.all
        @@all
    end

    # Collect all bloodoaths from current cult
    def cult_bloodoaths
        BloodOath.all.select{|oaths|
            oaths.cult == self
        }
    end

    # Checks if a follower exists with a bloodoath, if not it creates one with the current time.    
    def recruit_follower(follower_name)
        if cult_bloodoaths.detect{|oath| oath.follower == follower_name}
            "The follower: #{follower_name.name}, is already in this cult, #{self.name}"
        else
            BloodOath.new(Time.now.strftime("%Y/%d/%m"), self, follower_name)
        end
    end

    # Gathers Total Population for current cult
    def cult_population
        cult_bloodoaths.select(&:follower).count
    end

    # Finds Cult by Name
    def self.find_by_name(name)
        self.all.name.select{|cult|
            cult.name == name
        }
    end

    # Finds Cult by Location
    def self.find_by_location(location)
        self.all.name.select{|cult|
        cult.location == location
    }
    end

    # Finds Cult by Founding_Year
    def self.find_by_founding_year(founding_year)
        self.all.name.select{|cult|
        cult.founding_year == founding_year
        }
    end

    # Advanced Methods - Analytics
    # Grabs Average Age
    def average_age
        age_collection = cult_bloodoaths.map(&:follower).map(&:age)
        (age_collection.compact.reduce(:+).to_f / cult_population).round(2)
    end

    # Grabs all of the cults ollowers mottos
    def my_followers_mottos
        cult_bloodoaths.map(&:follower).map(&:life_motto).compact
    end

    # Grabs the cult with the least number of followers
    def self.least_popular
        follower_total = {}
        self.all.each{|cult|

            follower_total[cult.name] = 1
            BloodOath.all.select{|oaths|

                if oaths.cult == cult
                    if oaths.follower
                        
                        follower_total[cult.name] += 1

                    end
                end 
            }
        }

        follower_total.sort_by{|name, total| total}.first
    end

    # Grabs the area with the most cults
    def self.most_common_location
        total_per_city = {}
        self.all.each{|cult|
            if !total_per_city.include?(cult.location)
                total_per_city[cult.location] = 1
            else
                total_per_city[cult.location] += 1
            end
        }
        total_per_city.sort.last
    end

end