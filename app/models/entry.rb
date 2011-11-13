require 'json'
require 'net/http'

class Entry < ActiveRecord::Base
  has_many :genres
  has_many :directors
  has_many :writers
  has_many :actors
  
  validates_uniqueness_of :title
  
  validates_presence_of :title
  #validates_presence_of :year
  
  validates_length_of :title, :minimum => 3, :maximum => 128
  #validates_length_of :year, :is => 4
  
  before_save :populate_from_imdb
  
  def populate_from_imdb
    query_string = "t=#{title}"
    
    if year
      query_string += "&y=#{year}"
    end
    
    url = "http://www.imdbapi.com/?#{URI.encode(query_string)}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    
    result = JSON.parse(data)
    
    self.year = result['Year']
    self.plot = result['Plot']
    self.rating = result['Rating']
    self.poster = result['Poster']
    
    populate_genres result
    
    populate_directors result
    
    populate_writers result
    
    populate_actors result
  end
  
  def populate_genres(result)
    genres = result['Genre'].split(",")
    
    self.genres = genres.map {|g| Genre.find_or_create_by_name(g.strip)}
  end
  
  def populate_directors(result)
    directors = result['Director'].split(",")
    
    self.directors = directors.map {|g| Director.find_or_create_by_name(g.strip)}
  end
  
  def populate_writers(result)
    writers = result['Writer'].split(",")
    
    self.writers = writers.map {|g| Writer.find_or_create_by_name(g.strip)}
  end
  
  def populate_actors(result)
    actors = result['Actors'].split(",")
    
    self.actors = actors.map {|g| Actor.find_or_create_by_name(g.strip)}
  end
end
