require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

## Cult
red = Cult.new("Red", "NY", 1981, "Red is Best!")
orange = Cult.new("Orange", "NY", 1978, "Orange orange.")
blue = Cult.new("Blue", "NJ", 1801, "Blue is True!")
green = Cult.new("Green", "MI", 1850, "Green is Mean!")
yellow = Cult.new("Yellow", "CA", 1776, "Yellow says Hellow!")

## Follower
### Red
jack = Follower.new("Jack Reacher", 32, "Live Hard!")
sander = Follower.new("Bernie Sanders", 75, "Live Free!")
lola = Follower.new("Lola Bunny", 107, "Die Hard.")

### Blue
thomas = Follower.new("Thomas Lukas", 37, "Mmhmm.")
george = Follower.new("George Crinks", 39, "Okay.")
patrick = Follower.new("Patrick Cocks", 45, "Hola.")

### Yellow
jonathan = Follower.new("Jonathan Team", 23, "Hello.")
dean = Follower.new("Dean Martin", 76, "Hello Blue World.")
oarther = Follower.new("Oarther Jicks", 19, "Goodbye my storms.")

### Green
frodo = Follower.new("Frodo Baggins", 19, "I'm Frodo Baggins.")
sam = Follower.new("Sam Baggins", 19, "My name's sam, `s right.")
carmello = Follower.new("Carmello Anthony", 20, "Yoooo.")

## BloodOath
### Red
oath_of_jack = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), red, jack)
oath_of_sander = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), red, sander)
oath_of_lola = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), red, lola)
### Blue
oath_of_thomas = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), blue, thomas)
oath_of_george = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), blue, george)
oath_of_patrick = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), blue, patrick)
### Yellow
oath_of_jonathan = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), yellow, jonathan)
oath_of_dean = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), yellow, dean)
# oath_of_oarther = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), yellow, oarther)
### Green
oath_of_frodo = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), green, frodo)
# oath_of_sam = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), green, sam)
# oath_of_carmello = BloodOath.new(Time.at(rand * Time.now.to_i).strftime("%Y/%d/%m"), green, carmello)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits