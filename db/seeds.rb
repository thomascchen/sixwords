# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Neighborhood.create(name: "Allston") #1
Neighborhood.create(name: "Back Bay") #2
Neighborhood.create(name: "Bay Village") #3
Neighborhood.create(name: "Beacon Hill") #4
Neighborhood.create(name: "Brighton") #5
Neighborhood.create(name: "Charlestown") #6
Neighborhood.create(name: "Chinatown") #7
Neighborhood.create(name: "Dorchester") #8
Neighborhood.create(name: "Downtown") #9
Neighborhood.create(name: "East Boston") #10
Neighborhood.create(name: "Fenway Kenmore") #11
Neighborhood.create(name: "Hyde Park") #12
Neighborhood.create(name: "Jamaica Plain") #13
Neighborhood.create(name: "Mattapan") #14
Neighborhood.create(name: "Mission Hill") #15
Neighborhood.create(name: "North End") #16
Neighborhood.create(name: "Roslindale") #17
Neighborhood.create(name: "Roxbury") #18
Neighborhood.create(name: "South Boston") #19
Neighborhood.create(name: "South End") #20
Neighborhood.create(name: "West End") #21
Neighborhood.create(name: "West Roxbury") #22

Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: 13)
Memoir.create(name: "Mike", age: 16, memoir: "Life is good. Life is bad.", neighborhood_id: 1)
Memoir.create(name: "Anna", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: 20)
Memoir.create(name: "Jill", age: 32, memoir: "I slept too much nuff said.", neighborhood_id: 5)
Memoir.create(name: "Ruby", age: 16, memoir: "Was greater, learned ruby, became greater.", neighborhood_id: 7)
Memoir.create(name: "Cece", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: 18)
