$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }

def directors_totals(nds)
  result = {}
  row = 0 
  director_len = nds.length 
  while row < director_len do 
    director_name = nds[row][:name]
    result[director_name] = gross_for_director(director_name)
    row += 1
  end 
  result 
end

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  movie_row = 0 
  movie_len = director_data[:movies].length
  gross = 0 
  while movie_row < movie_len do 
    gross += director_data[:movies][movie_row][:worldwide_gross]
    movie_row += 1 
  end 
  gross 
end

puts directors_totals(directors_database)