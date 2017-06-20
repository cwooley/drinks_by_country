require 'csv'
require 'SQLite3'
require 'pry'
class DrinksByCountry
  #MAKE NEW DATABASE FROM .CSV
  # @@db = SQLite3::Database.new ":memory:"
  @@db = SQLite3::Database.new "drinks.db"
  @@db.results_as_hash = true

  @@db.execute("DROP TABLE IF EXISTS drinks_by_country")

  ############## MAKE DRINKS BY COUNTRY TABLE #####################
  rows = @@db.execute <<-SQL
    create table drinks_by_country (
      country text,
      beer_servings INTEGER,
      spirit_servings INTEGER,
      wine_servings INTEGER,
      total_litres_of_pure_alcohol INTEGER
    );
  SQL

  csv = File.read("drinks.csv")

  CSV.parse(csv, headers: true) do |row|
    @@db.execute "INSERT INTO drinks_by_country VALUES ( ?, ?, ?, ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
  end

  ####################################################################

  @@db.execute("DROP TABLE IF EXISTS country_pop")

  ############## MAKE COUNTRY POP TABLE #####################
  rows = @@db.execute <<-SQL
    create table country_pop (
      country_name TEXT,
      population INTEGER
    );
  SQL

  csv = File.read("country_pop_data.csv")

  CSV.parse(csv, headers: true) do |row|
    @@db.execute "INSERT INTO country_pop VALUES ( ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
  end


########################################################################
  def self.db
    @@db
  end




  # p db.execute( "select * from drinks_by_country" )
  def self.most_beer
   db.execute( "SELECT country, beer_servings FROM drinks_by_country ORDER BY beer_servings DESC LIMIT 1")
  end

  def self.least_beer
    db.execute( "SELECT country, beer_servings FROM drinks_by_country WHERE beer_servings > 0 ORDER BY beer_servings LIMIT 1 ")
  end

  def self.most_wine
    db.execute( "SELECT country, wine_servings FROM drinks_by_country ORDER BY wine_servings DESC LIMIT 1")
  end

  def self.least_wine
    db.execute( "SELECT country, wine_servings FROM drinks_by_country WHERE wine_servings > 0 ORDER BY wine_servings LIMIT 1")
  end

  def self.most_spirits
    db.execute( "SELECT country, spirit_servings FROM drinks_by_country ORDER BY spirit_servings DESC LIMIT 1")
  end

  def self.least_spirits
    db.execute( "SELECT country, spirit_servings FROM drinks_by_country WHERE spirit_servings > 0 ORDER BY spirit_servings LIMIT 1")
  end

  def self.country_pop_all
    db.execute( "SELECT * FROM country_pop")
  end

  def self.joining_tables
    db.execute("SELECT country_pop.country_name FROM country_pop JOIN drinks_by_country ON drinks_by_country.country = country_pop.country_name")
  end

end

# puts "What is the country that drinks the most beer?"
# puts DrinksByCountry.most_beer[0]["country"] + " with this much beer " + DrinksByCountry.most_beer[0]["beer_servings"].to_s
# puts "What is the country that drinks the most wine?"
# puts DrinksByCountry.most_wine[0]["country"]
# puts "What is the country that drinks the most spirits?"
# puts DrinksByCountry.most_spirits[0]["country"]
# puts "What is the country that drinks the least beer?"
# puts DrinksByCountry.least_beer[0]["country"]
# puts "What is the country that drinks the least wine?"
# puts DrinksByCountry.least_wine[0]["country"]
# puts "What is the country that drinks the least spirits?"
# puts DrinksByCountry.least_spirits[0]["country"]

puts DrinksByCountry.joining_tables
