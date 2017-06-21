# require 'csv'
class DrinksByCountry
  @@db = SQLite3::Database.new "drinks.db"
  @@db.results_as_hash = true

  @@db.execute("DROP TABLE IF EXISTS drinks_by_country")

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

  def self.db
    @@db
  end

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

end
