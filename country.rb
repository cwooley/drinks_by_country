require 'SQLite3'
require_relative 'drinks.rb'
class Country
  @@all = []
  @@DB = Database.db
  @@DB.results_as_hash = true
  attr_accessor :beer_servings
  def initialize(attr_hash)
    # @id =
    @name = attr_hash["country"]
    @id = attr_hash["id"]
    @beer_servings =  attr_hash["beer_servings"].to_i
    @wine_servings = attr_hash["wine_servings"].to_i
    @spirits_servings = attr_hash["spirits_servings"].to_i
    @total_liters_alcohol = attr_hash["total_litres_of_pure_alcohol"].to_float
    @@all << self
  end

  def self.all
    @@all
  end
  def self.select_all
    select_all_stuff = "SELECT * FROM drinks_by_country "
    @@DB.execute(select_all_stuff)
  end

  def self.get_countries_attrs(name)
    select_all_by_country = "SELECT * FROM drinks_by_country WHERE country = '#{name}'"
    @@DB.execute(select_all_by_country)
  end

  def self.find_most_wine
    #Query will not order right because data type of everything in DB is string.
    # query = "SELECT country, wine_servings FROM drinks_by_country ORDER BY wine_servings DESC"


    @@DB.execute(query)
  end
end

  # test = Country.new("Test Country")
  #
  # Country.select_all.each do |country_hash|
  #   country = Country.new(country_hash)
  # end

  p Country.get_countries_attrs("Canada")

# puts  Country.find_most_wine
