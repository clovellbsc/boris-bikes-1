# Boris Bikes

## Task set

Welcome to being a developer
Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer (that was easy). Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## Getting started

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## Instructions on use

* To create a new docking station object, start a new IRB requiring the docking_station.rb file. This creates a new docking station, with a default capacity of 20 bikes:
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00007faa3b0f6418 @rack=[], @capacity=20> 
```

* You can create a new bike. This then can be docked into the dock:
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > bike = Bike.new
 => #<Bike:0x00007f81388d1dd0> 
3.0.0 :002 > docking_station = DockingStation.new
 => #<DockingStation:0x00007f81388e99a8 @rack=[], @capacity=20> 
3.0.0 :003 > docking_station.docking_bike(bike)
 => [#<Bike:0x00007f81388d1dd0>] 
```

* You can use the stored_bikes method to view the bikes currently stored at the docking station.
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00007fd055926ff8 @rack=[], @capacity=20> 
3.0.0 :002 > docking_station.docking_bike(Bike.new)
 => 5 
3.0.0 :003 > docking_station.stored_bikes
 => [#<Bike:0x00007fd0568d4f90>] 
```

* You can use the release_bike method to release a bike from the docking station.
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00007faa7c9190c8 @rack=[], @capacity=20> 
3.0.0 :002 > docking_station.docking_bike(Bike.new)
 => [#<Bike:0x00007faa7c04c788>] 
3.0.0 :003 > docking_station.release_bike
 => #<Bike:0x00007faa7c04c788> 
3.0.0 :004 > docking_station.bikes
 => [] 
```

* You can use the report_broken method to report bikes as broken when docking them.
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00007ff66c9391e8 @rack=[], @capacity=20> 
3.0.0 :002 > bike = Bike.new
 => #<Bike:0x00007ff66c91f428> 
3.0.0 :003 > bike.report_broken
 => true 
3.0.0 :004 > docking_station.docking_bike(Bike.new)
 => [#<Bike:0x00007ff66c91f428 @broken=true>] 
```

### Coverage
There are various methods in place to ensure the correct use of docking stations. Certain things will be restricted:
* You will not be able to release a broken bike
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00000001318faca0 @stored_bikes=[], @CAPACITY=20> 
3.0.0 :002 > bike = Bike.new
 => #<Bike:0x00000001128163a8 @working=true> 
3.0.0 :003 > bike.report_broken
 => false 
3.0.0 :004 > docking_station.docking_bike(bike)
 => [#<Bike:0x00000001128163a8 @working=false>] 
3.0.0 :005 > docking_station.release_bike
Traceback (most recent call last):
        5: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `<main>'
        4: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `load'
        3: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/lib/ruby/gems/3.0.0/gems/irb-1.3.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5:in `<main>'
        1: from /Users/chrislovell/Desktop/Projects/boris-bikes-1/lib/DockingStation.rb:14:in `release_bike'
RuntimeError (Bike is broken)
```
* You will not be able to release a bike from an empty docking station
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x000000013fb5ee70 @stored_bikes=[], @CAPACITY=20> 
3.0.0 :002 > docking_station.release_bike
Traceback (most recent call last):
        5: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `<main>'
        4: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `load'
        3: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/lib/ruby/gems/3.0.0/gems/irb-1.3.0/exe/irb:11:in `<top (required)>'
        2: from (irb):2:in `<main>'
        1: from /Users/chrislovell/Desktop/Projects/boris-bikes-1/lib/DockingStation.rb:13:in `release_bike'
NoBikeError (NoBikeError)
```
* You will not be able to dock a bike to a full docking station
```
irb -r ./lib/DockingStation.rb
3.0.0 :001 > docking_station = DockingStation.new
 => #<DockingStation:0x00000001592207e0 @stored_bikes=[], @CAPACITY=20> 
3.0.0 :002 > 20.times { docking_station.docking_bike(Bike.new) }
 => 20 
3.0.0 :003 > docking_station.docking_bike(Bike.new)
Traceback (most recent call last):
        5: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `<main>'
        4: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `load'
        3: from /Users/chrislovell/.rvm/rubies/ruby-3.0.0/lib/ruby/gems/3.0.0/gems/irb-1.3.0/exe/irb:11:in `<top (required)>'
        2: from (irb):3:in `<main>'
        1: from /Users/chrislovell/Desktop/Projects/boris-bikes-1/lib/DockingStation.rb:19:in `docking_bike'
DockFullError (DockFullError)
```

## Testing

The program contains a series of tests using Rspec (this library should be installed if the steps above were followed)

To run all tests across all class files, do the following:

```
rspec
```
