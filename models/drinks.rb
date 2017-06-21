require 'SQLite3'
require "CSV"
require "pry"

class Drinks
  @@db = SQLite3::Database.new "drinks.db"
  @@db.results_as_hash = true

  @@db.execute <<-SQL
    create table drinks (
      id INTEGER PRIMARY KEY,
      name TEXT
    );
  SQL

  @@db.execute "INSERT INTO drinks (name) VALUES ('beer')"
  @@db.execute "INSERT INTO drinks (name) VALUES ('wine')"
  @@db.execute "INSERT INTO drinks (name) VALUES ('spirit')"
  @@db.execute "INSERT INTO drinks (name) VALUES ('pure')"

  def self.db
    @@db
  end

  def self.all
    @@db.execute "SELECT * FROM drinks"
  end
end

puts Drinks.all
