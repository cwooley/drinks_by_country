require 'CSV'
require 'SQLite3'
require 'pry'

class Countries

  ##2015 Population data

  @@db = SQLite3::Database.new "drinks.db"

  @@db.execute("DROP TABLE IF EXISTS countries")

  ############## MAKE COUNTRY POP TABLE #####################
  @@db.execute <<-SQL
    create table countries (
      id INTEGER PRIMARY KEY,
      name TEXT,
      population INTEGER
    );
  SQL

  csv = File.read("country_pop_data.csv")

  CSV.parse(csv, headers: true) do |row|
    @@db.execute "INSERT INTO countries (name, population) VALUES ( ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
  end

  def self.db
    @@db
  end

  def self.most_pop
    @@db.execute "SELECT * FROM countries ORDER BY population DESC LIMIT 1"
  end

  def self.least_pop
    @@db.execute "SELECT * FROM countries ORDER BY population LIMIT 1"
  end

end
