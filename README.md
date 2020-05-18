Blood Oath Lab
==============

In this project, we will be practicing object relationships in Ruby, with a particular emphasis on the `has_many` `through` relationship (aka: many-to-many). Please read the whole README before writing any code!

## Introduction

You've been approached by your local cult leaders to build out a foundation for a new app they are all using to gather recruits. As the open-minded freelancers that you are, you've agreed to do so!

---

## Setup (Code Overview)

Before you begin, first run the following command in your terminal to install the dependencies required for this lab:

```sh
bundle install
```

You can now add all of your Ruby files for your models in the `app/models` folder. You **do not** need to require them. They will be automagically require for you so long as you use the `tools/console.rb` file to run your code.

Through this file, we've provided to you a console that you can use to test your code. To enter a console session, run `ruby tools/console.rb` from the command line. You'll be able to test out the methods that you write here. Take a look at that file to see how you can pre-define variables and create object instances, rather than manually doing it in every single console session.

## Your Job

Your goal is to build out all of the methods listed in the deliverables. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`.

---

## Deliverables

### Domain Modeling

First step is to model the domain you are building out. As a non-discriminatory cult recruitment platform, `Cult`s will have many `Follower`s while `Follower`s will be allowed to join many `Cult`s. How do they keep track of this? `BloodOath`s of course! You cannot join a `Cult` without making a `BloodOath`.

* What are your models?
* What does your schema look like?
* What are the relationships between your models?

---

### Basic Class Attributes and Methods

With your domain modeled, you now need to build out some basic functionality so both `Cult`s and `Follower`s can use your platform to make `BloodOath`s. A social network of cults if you will. So general searching type functionality.

Questions you should ask yourself:

* Do I need any other attributes?
* Should I write any other methods?
* Am I following _Single Source of Truth_?

![Logan Roy](tenor.gif)

**`Cult`**

- [x] `Cult#name`
  * returns a `String` that is the cult's name

```ruby
ham.name
=> "Humans Against Monsters"
```
---
- [x] `Cult#location`
  * returns a `String` that is the city where the cult is located

```ruby
trinity.location
=> "Yamatai Island"
```
---
- [x] `Cult#founding_year`
  * returns an `Integer` that is the year the cult was founded

```Ruby
project_mayhem.founding_year
=> 1996
```
---
- [x] `Cult#slogan`
  * returns a `String` that is this cult's slogan

```ruby
solarii.slogan
=> "Brotherhood of the Sun"
```
---
- [x] `Cult#recruit_follower`
  * takes in an argument of a `Follower` instance and adds them to this cult's list of followers

```ruby
trinity.recruit_follower(sliske)
# so this was the output [1]
=> #<BloodOath:0x00007fbc8805a1f8
@cult=
#<Cult:0x00007fbc8900df50
 @founding_year=978,
 @location="Yamatai Island",
 @name="Trinity",
 @slogan="...then blood it shall be">,
@follower=
#<Follower:0x00007fbc8900dc30
 @age=23,
 @motto="Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?",
 @name="Sliske">,
@initiation_date="2020-05-16 20:23:11 -0400">   
````
  ---

- [x] `Cult#cult_population`
  * returns an `Integer` that is the number of followers in this cult

```ruby
trinity.cult_population
=> 2
# bc only Sliske [1] and Lara Croft joined.
```
---
- [x] `Cult.all`
  * returns an `Array` of all the cults

```ruby
  Cult.all
  => [#<Cult:0x00007f89021e7ef8 @founding_year=1869, @location="Abandoned Mine", @name="Humans Against Monsters", @slogan="Cor blimey, mate! What are ye doing in me pockets?">,
   #<Cult:0x00007f89021e7e08 @founding_year=978, @location="Yamatai Island", @name="Trinity", @slogan="...then blood it shall be">,
   #<Cult:0x00007f89021e7d68 @founding_year=1980, @location="Yamatai Island", @name="Solarii", @slogan="Brotherhood of the Sun">,
   #<Cult:0x00007f89021e7ca0 @founding_year=1996, @location="Paper Street House", @name="Project Mayhem", @slogan="You don't ask questions about Project Mayhem.">]
```
---
- [x] `Cult.find_by_name`
  * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument

```ruby
  Cult.find_by_name("Humans Against Monsters")
  => [#<Cult:0x00007f84b98f2d08 @founding_year=1869, @location="Abandoned Mine", @name="Humans Against Monsters", @slogan="Cor blimey, mate! What are ye doing in me pockets?">]
```

- [x] `Cult.find_by_location`
  * takes a `String` argument that is a location and returns an `Array` of cults that are in that location

```ruby
  Cult.find_by_location("Yamatai Island")
  => [#<Cult:0x00007fdd7210ddb0
  @founding_year=978,
  @location="Yamatai Island",
  @name="Trinity",
  @slogan="...then blood it shall be">,
  #<Cult:0x00007fdd7210dd10
  @founding_year=1980,
  @location="Yamatai Island",
  @name="Solarii",
  @slogan="Brotherhood of the Sun">]
```
---

- [x] `Cult.find_by_founding_year`
  * takes an `Integer` argument that is a year and returns all of the cults founded in that year

```Ruby
  Cult.find_by_founding_year(1996)
  => [#<Cult:0x00007fd894056e68
  @founding_year=1996,
  @location="Paper Street House",
  @name="Project Mayhem",
  @slogan="You don't ask questions about Project Mayhem.">]
```
---

**`Follower`**

- [x] `Follower#name`
  * returns a `String` that is the follower's name

```Ruby
robert_paulson.name
=> "Robert Paulson"
```
---
- [x] `Follower#age`
  * returns an `Integer` that is the age of the follower

```ruby
  lara_croft.age
  => 30
```
---

- [x] `Follower#life_motto`
  * returns a `String` that is the follower's life motto

```ruby
  sliske.motto
  => "Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?"
```
---
- [x] `Follower#cults`
  * returns an `Array` of this follower's cults

```Ruby
  lara_croft.cults
  => [#<BloodOath:0x00007fc9a31af918
  @cult=
   #<Cult:0x00007fc9a31afc60
    @founding_year=978,
    @location="Yamatai Island",
    @name="Trinity",
    @slogan="...then blood it shall be">,
  @follower=
   #<Follower:0x00007fc9a31afa30
    @age=30,
    @motto="The extraordinary is in what we do, not who we are.",
    @name="Lara Croft">,
  @initiation_date="2003-04-20">,
 #<BloodOath:0x00007fc9a31af8c8
  @cult=
   #<Cult:0x00007fc9a31afbc0
    @founding_year=1980,
    @location="Yamatai Island",
    @name="Solarii",
    @slogan="Brotherhood of the Sun">,
  @follower=
   #<Follower:0x00007fc9a31afa30
    @age=30,
    @motto="The extraordinary is in what we do, not who we are.",
    @name="Lara Croft">,
  @initiation_date="2000-03-18">]
```
---

- [x] `Follower#join_cult`
  * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers

```ruby
  lara_croft.join_cult(ham)
  # output
  => #<BloodOath:0x00007fb313898438
  @cult=
  #<Cult:0x00007fb3148ec8c0
   @founding_year=1869,
   @location="Abandoned Mine",
   @name="Humans Against Monsters",
   @slogan="Cor blimey, mate! What are ye doing in me pockets?">,
  @follower=
  #<Follower:0x00007fb3148ec5f0
   @age=30,
   @motto="The extraordinary is in what we do, not who we are.",
   @name="Lara Croft">,
 @initiation_date="2020-05-16 20:11:27 -0400">
```
---

- [x] `Follower.all`
  * returns an `Array` of all the followers

```ruby
  Follower.all
  => [#<Follower:0x00007ff56203ba60
    @age=45,
    @motto="His name was Robert Paulson.",
    @name="Robert Paulson">,
   #<Follower:0x00007ff56203b9e8
  @age=30,
  @motto="The extraordinary is in what we do, not who we are.",
  @name="Lara Croft">,
  #<Follower:0x00007ff56203b970
  @age=23,
  @motto="Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?",
  @name="Sliske">]
```
---

- [x] `Follower.of_a_certain_age`
  * takes an `Integer` argument that is an age and returns an `Array` of followers who are the given age or older

```ruby
  Follower.of_a_certain_age(30)
  => [#<Follower:0x00007fde8d87b518
    @age=45,
    @motto="His name was Robert Paulson.",
    @name="Robert Paulson">,
  #<Follower:0x00007fde8d87b4a0
  @age=30,
  @motto="The extraordinary is in what we do, not who we are.",
  @name="Lara Croft">]
```
---
**`BloodOath`**

- [x] `BloodOath#initiation_date`
  * returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.

 ```ruby
  bo1.initiation_date
  "2003-4-20"
  # not 100% certain if this date should be formatted in anyway
  # do revisit this
```
---
- [x] `BloodOath.all`
  * returns an `Array` of all the blood oaths

```ruby
  BloodOath.all
  => [#<BloodOath:0x00007feb7e908708
    @cult=
     #<Cult:0x00007feb7e908a50
      @founding_year=978,
      @location="Yamatai Island",
      @name="Trinity",
      @slogan="...then blood it shall be">,
    @follower=
     #<Follower:0x00007feb7e908820
      @age=30,
      @motto="The extraordinary is in what we do, not who we are.",
      @name="Lara Croft">,
    @initiation_date="2003-04-20">,
   #<BloodOath:0x00007feb7e9086b8
    @cult=
     #<Cult:0x00007feb7e9089b0
      @founding_year=1980,
      @location="Yamatai Island",
      @name="Solarii",
      @slogan="Brotherhood of the Sun">,
    @follower=
     #<Follower:0x00007feb7e908820
      @age=30,
      @motto="The extraordinary is in what we do, not who we are.",
      @name="Lara Croft">,
    @initiation_date="2000-03-18">,
   #<BloodOath:0x00007feb7e908668
    @cult=
     #<Cult:0x00007feb7e908910
      @founding_year=1996,
      @location="Paper Street House",
      @name="Project Mayhem",
      @slogan="You don't ask questions about Project Mayhem.">,
    @follower=#<Follower:0x00007feb7e908898
    @age=45,
    @motto="His name was Robert Paulson.",
    @name="Robert Paulson">,
    @initiation_date="2005-11-27">,
   #<BloodOath:0x00007feb7e908618
    @cult=
     #<Cult:0x00007feb7e908af0
      @founding_year=1869,
      @location="Abandoned Mine",
      @name="Humans Against Monsters",
      @slogan="Cor blimey, mate! What are ye doing in me pockets?">,
    @follower=
     #<Follower:0x00007feb7e9087a8
      @age=23,
      @motto="Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?",
      @name="Sliske">,
    @initiation_date="2020-03-29">]
```
---

### Advanced Methods - Analytics!

Our cult social network platform is working well. Let's first make a commit!

Now we want to build out some useful features so `Cult`s and `Follower`s and get more value out of our app.

**`Cult`**

- [x] `Cult#average_age`
  * returns a `Float` that is the average age of this cult's followers

```ruby
  # using trinity for this example, both ages were 30 and 23
  trinity.average_age
  => 26.5
```
---

- [x] `Cult#my_followers_mottos`
  * prints out all of the mottos for this cult's followers

```ruby
  trinity.my_followers_mottos
  => [
    "The extraordinary is in what we do, not who we are.",
    "Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?"
  ]
```
---

- [x] `Cult.least_popular`
  * returns the `Cult` instance who has the least number of followers :(

```ruby
  Cult.least_popular
  => #<Cult:0x00007f89d68b8258
  @founding_year=1980,
  @location="Yamatai Island",
  @name="Solarii",
  @slogan="Brotherhood of the Sun">
```
---
- [x] `Cult.most_common_location`
  * returns a `String` that is the location with the most cults

```ruby
  Cult.most_common_location
  "Yamatai Island"
```
---

**`Follower`**

- [x] `Follower#my_cults_slogans`
  * prints out all of the slogans for this follower's cults

```ruby
  lara_croft.my_cults_slogans
  => ["...then blood it shall be", "Brotherhood of the Sun", "Cor blimey, mate! What are ye doing in me pockets?"]
```
---

**Note: Had to create more followers for these two, but the methods above still do work, even if the output by now is different**

- [x] `Follower.most_active`
  * returns the `Follower` instance who has joined the most cults

```Ruby
  Follower.most_active
  => #<Follower:0x00007fc80b91f868
  @age=21,
  @motto="What if I told you there is an app on the market...",
  @name="Jian-Yang">
```
---

- [x] `Follower.top_ten`
  * returns an `Array` of followers; they are the ten most active followers

```ruby
  Follower.top_ten
  # if it wanted every instance
  => [#<Follower:0x00007f90920eb328 @age=21, @motto="What if I told you there is an app on the market...", @name="Jian-Yang">, #<Follower:0x00007f90920eb580 @age=30, @motto="The extraordinary is in what we do, not who we are.", @name="Lara Croft">, #<Follower:0x00007f90920eaf40 @age=12, @motto="Die frage ist nicht wo, sondern wann", @name="Mikkel Nielsen">,  #<Follower:0x00007f90920eb3c8 @age=16, @motto="My philosophy is 'strength from chaos and adversity'.", @name="Zamorak">, #<Follower:0x00007f90920eace8 @age=76, @motto="Sunce ti kalajsano!", @name="Izet Fazlinovic">, #<Follower:0x00007f90920eaa90 @age=34, @motto="Is there a commandment against eating ziti?", @name="Carmela Soprano">, #<Follower:0x00007f90920eaa18 @age=32, @motto="YOU CAN'T MAKE A TOMLETTE WITHOUT BREAKING A FEW GREGGS!", @name="Tom Wambsgans">, #<Follower:0x00007f90920eb648 @age=45, @motto="His name was Robert Paulson.", @name="Robert Paulson">, #<Follower:0x00007f90920eb080 @age=70, @motto="F*ck off", @name="Logan Roy">, #<Follower:0x00007f90920eb4b8 @age=23, @motto="Hmmm, I wonder if there will be the opportunity to kill one bird with two stones?", @name="Sliske">]
  # or if it wanted an array
  => ["Jian-Yang", "Lara Croft", "Mikkel Nielsen", "Zamorak", "Izet Fazlinovic", "Carmela Soprano", "Tom Wambsgans", "Robert Paulson", "Logan Roy", "Sliske"]
```
---
**`BloodOath`**

- [x] `BloodOath.first_oath`
  * returns the `Follower` instance for the follower that made the very first blood oath

```Ruby
  BloodOath.first_oath
  => #<Follower:0x00007f93ec06b3a0
  @age=30,
  @motto="The extraordinary is in what we do, not who we are.",
  @name="Lara Croft">
```

---

### BONUS!

Our platform is done! Let's commit our code!

Now one highly requested feature from `Follower`s using your app that you plan to paywall ($$$) is to see your fellow cult members. See if you can implement this method.

- [x] `Follower#fellow_cult_members`
  * returns a unique `Array` of followers who are in the same cults as you
    A highly requested feature from `Cult`s using your app that you plan to paywall ($$$) is to restrict ages for recruits. See if you can implement this functionality.
```ruby
lara_croft.fellow_cult_members
=> ["Sliske", "Jian-Yang"]
```
---

- [x] `Cult#minimum_age`
  * returns an `Integer` that is the minimum age required for followers joining this cult

```ruby
  # set as default age for all of them right now
  waystar_royco.minimum_age
  => 20
```
---

- [x] `Cult#recruit_follower`
  * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
  * NOW this is changed such that if the given `Follower` instance is not of age:
    * do not let them join the cult
    * print out a friendly message informing them that they are too young

```ruby
    waystar_royco.recruit_follower(mikkel_nielsen) # who is 12 in both 1986 and 2019 ¯\_(ツ)_/¯
    => "NEXT"
```
---
- [x] `Follower#join_cult`
  * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
  * NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
    * do not let them join the cult
    * print out a friendly message informing them that they are too young

```ruby
    mikkel_nielsen.join_cult(trinity)
    => "WE NEED ANOTHER BLOOD SACRIFICE"
```

Congrats on finishing your cult social network platform. Time to rake in the $$$!
