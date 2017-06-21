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


end
