# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

categories = Category.create!( [ 
  {:name => 'Fantasy Books'},
  {:name => 'Sci-Fi Blu-Rays'},
  {:name => 'Boardgames'},
  {:name => 'Heavy Metal'},
] )

fantasy = categories.first.id
sci_fi = categories.second.id
boardgames = categories.third.id
heavy_metal = categories.fourth.id

Product.create!([ 
  { :name => 'Lord of the Rings', 
    :description => 'Tells the story of a bunch of friends that have to take the One Ring',
    :category_id => fantasy, 
    :price => 20},
  {:name => 'Battlestar Galactica: The Complete Series', 
   :description => 'All four seasons in a single pack', 
   :category_id => sci_fi, 
   :price => 39.90 },
  {:name => 'Battlestar Galactica: The Boardgame', 
   :description => 'A game of strife, space fights and intrige', 
   :category_id => boardgames,
   :price => 59.90
   },
  {:name => 'Waterlines', 
   :description => 'Excalion album from 2008', 
   :category_id => heavy_metal,
   :price => 19.90
   },
  {:name => 'The Adventures of Lord Iffy Boatrace', 
   :description => 'Iron Maiden\'s singer Bruce Dickingson first published book',
   :price => 15.00,
   :category_id => fantasy,
   },
  {:name => 'The Missionary Position', 
   :description => 'Iron Maiden\'s singer Bruce Dickingson second published book',
   :price => 15.00,
   :category_id => fantasy,
   },
   {:name => 'The Number of the Beast',
    :description => 'Iron Maiden\'s first album with Bruce Dickingson',
    :price => 19.90,
    :category_id => heavy_metal
   },
   {:name => 'Piece of Mind',
    :description => 'Iron Maiden\'s fourth album',
    :price => 19.90,
    :category_id => heavy_metal
   },
   {:name => 'Powerslave',
    :description => 'Iron Maiden\'s fifth album',
    :price => 19.90,
    :category_id => heavy_metal
   },
   {:name => 'Somewhere In Time',
    :description => 'Iron Maiden\'s sixth album',
    :price => 19.90,
    :category_id => heavy_metal
   },
   {:name => 'Seventh Son of a Seventh Son',
    :description => 'Iron Maiden\'s seventh album',
    :price => 19.90,
    :category_id => heavy_metal
   },
   {:name => 'No Prayer for the Dying',
    :description => 'Iron Maiden\'s eight album',
    :price => 19.90,
    :category_id => heavy_metal
   },
])