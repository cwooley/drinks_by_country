require 'CSV'
class CountriesPop

  ##2015 Population data

  @@db = SQLite3::Database.new "drinks.db"

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

  def self.db
    @@db
  end

  def self.most_pop
    @@db.execute "SELECT * FROM country_pop ORDER BY population DESC LIMIT 1"
  end

  def self.least_pop
    @@db.execute "SELECT * FROM country_pop ORDER BY population LIMIT 1"
  end

end
