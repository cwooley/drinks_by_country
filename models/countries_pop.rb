require 'CSV'
class CountriesPop

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


end
