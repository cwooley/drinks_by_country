require 'SQLite3'
require "CSV"
require "pry"

class DrinksByCountry
  @@db = SQLite3::Database.new "drinks.db"
  @@db.results_as_hash = true

  @@db.execute("DROP TABLE IF EXISTS drinks_by_country")

  @@db.execute <<-SQL
    create table drinks_by_country (
      country_id INTEGER,
      drink_id INTEGER,
      consumption INTEGER
    );
  SQL

  csv = File.read("drinks.csv")

  CSV.parse(csv, headers: true) do |row|
    country_id = @@db.execute "SELECT id FROM countries WHERE name = ?", row['country']
    if country_id[0]
      country_id =  country_id[0]["id"]
      beer = row["beer_servings"]
      wine = row["wine_servings"]
      spirit = row["spirit_servings"]
      pure = row["total_litres_of_pure_alcohol"]
      # binding.pry
      @@db.execute "INSERT INTO drinks_by_country VALUES ( ?, ?, ?)", [country_id, 1, beer]
      @@db.execute "INSERT INTO drinks_by_country VALUES ( ?, ?, ?)", [country_id, 2, wine]
      @@db.execute "INSERT INTO drinks_by_country VALUES ( ?, ?, ?)", [country_id, 3, spirit]
      @@db.execute "INSERT INTO drinks_by_country VALUES ( ?, ?, ?)", [country_id, 4, pure]
    end
  end

  def self.db
    @@db
  end

  def self.all
    @@db.execute "SELECT * FROM drinks_by_country"
  end

end
