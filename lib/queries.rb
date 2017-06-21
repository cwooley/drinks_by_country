require_relative '../enviornment.rb'
class Queries

  def initialize
    @db = DrinksByCountry.db
  end
  def get_country_by_name(name)
    sql = "SELECT * FROM countries
      JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
      JOIN drinks ON drinks_by_country.drink_id = drinks.id
      WHERE countries.name = '#{name}' LIMIT 4"
    hash_arr = @db.execute(sql)
    attr_hash = {}
    attr_hash["name"]= hash_arr[0][1]
    attr_hash["beer"]= hash_arr[0]["consumption"]
    attr_hash["wine"]= hash_arr[1]["consumption"]
    attr_hash["spirit"]= hash_arr[2]["consumption"]
    attr_hash["pure"]= hash_arr[3]["consumption"]
    attr_hash["population"]= hash_arr[0]["population"]
    Country.new(attr_hash)
  end

  def most_beer_by_volume

  end


  def pools_of_beer_by_country(country_name)
    country = get_country_by_name(country_name)
    pools = country.pools_of_beer.to_i
    puts "#{country.name} drinks a total of #{pools} olympic-sized pools of beer every year."
  end

  def bathtubs_of_beer_by_country(country_name)
    country = get_country_by_name(country_name)
    tubs = country.tubs_of_beer.to_i
    puts "#{country.name} drinks a total of #{tubs} bathtubs full of beer every year."
  end

  def central_park_lakes_of_beer_by_country(country_name)
    country = get_country_by_name(country_name)
    lakes = country.central_park_lakes_of_beer
    puts "#{country.name} drinks a total #{lakes} central park lakes of beer every year."
  end

  def pools_of_wine_by_country(country_name)
    country = get_country_by_name(country_name)
    pools = country.pools_of_wine.to_i
    puts "#{country.name} drinks a total of #{pools} olympic-sized pools of wine every year."
  end

  def bathtubs_of_wine_by_country(country_name)
    country = get_country_by_name(country_name)
    tubs = country.tubs_of_wine.to_i
    puts "#{country.name} drinks a total of #{tubs} bathtubs full of wine every year."
  end

  def central_park_lakes_of_wine_by_country(country_name)
    country = get_country_by_name(country_name)
    lakes = country.central_park_lakes_of_wine
    puts "#{country.name} drinks a total #{lakes} central park lakes of wine every year."
  end

  def pools_of_spirit_by_country(country_name)
    country = get_country_by_name(country_name)
    pools = country.pools_of_spirit.to_i
    puts "#{country.name} drinks a total of #{pools} olympic-sized pools of spirits every year."
  end

  def bathtubs_of_spirit_by_country(country_name)
    country = get_country_by_name(country_name)
    tubs = country.tubs_of_spirit.to_i
    puts "#{country.name} drinks a total of #{tubs} bathtubs full of spirits every year."
  end

  def central_park_lakes_of_spirit_by_country(country_name)
    country = get_country_by_name(country_name)
    lakes = country.central_park_lakes_of_spirit
    puts "#{country.name} drinks a total #{lakes} central park lakes of spirits every year."
  end

  ###question "who drinks the most total beer/wine/spirits?"

  def most_beer_total
    sql = "SELECT * FROM countries
          JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
          JOIN drinks ON drinks_by_country.drink_id = drinks.id
          WHERE drinks.id = 1
          ORDER BY (countries.population * drinks_by_country.consumption) DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most total beer, they drink a whopping #{country.liters_of_beer} liters every year!"
  end

  def most_wine_total
    sql = "SELECT * FROM countries
          JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
          JOIN drinks ON drinks_by_country.drink_id = drinks.id
          WHERE drinks.id = 2
          ORDER BY (countries.population * drinks_by_country.consumption) DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most total wine, they drink a whopping #{country.liters_of_wine} liters every year!"
  end

  def most_spirit_total
    sql = "SELECT * FROM countries
          JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
          JOIN drinks ON drinks_by_country.drink_id = drinks.id
          WHERE drinks.id = 3
          ORDER BY (countries.population * drinks_by_country.consumption) DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most total spirits, they drink a whopping #{country.liters_of_spirit} liters every year!"
  end

  ###question "who drinks the most beer/wine/spirits per captia?"

  def most_beer_per_person
    sql = "SELECT * FROM countries
    JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
    JOIN drinks ON drinks_by_country.drink_id = drinks.id
    WHERE drinks.id = 1
    ORDER BY consumption DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most beer per person. On average they each drink #{country.beer_servings} servings of beer every year!"
  end

  def most_wine_per_person
    sql = "SELECT * FROM countries
    JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
    JOIN drinks ON drinks_by_country.drink_id = drinks.id
    WHERE drinks.id = 2
    ORDER BY consumption DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most wine per person. On average they each drink #{country.wine_servings} servings of wine every year!"
  end

  def most_spirit_per_person
    sql = "SELECT * FROM countries
    JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
    JOIN drinks ON drinks_by_country.drink_id = drinks.id
    WHERE drinks.id = 3
    ORDER BY consumption DESC LIMIT 1"
    country = get_country_by_name(@db.execute(sql)[0][1])

    puts "#{country.name} drinks the most spirits per person. On average they each drink #{country.spirit_servings} servings of spirits every year!"
  end

  ## RATIOS


  
end


query = Queries.new

puts query.pools_of_beer_by_country("Canada")
puts query.pools_of_wine_by_country("Canada")
puts query.pools_of_spirit_by_country("Canada")

puts query.central_park_lakes_of_beer_by_country("Germany")
puts query.central_park_lakes_of_wine_by_country("Germany")
puts query.central_park_lakes_of_spirit_by_country("Germany")

puts query.bathtubs_of_beer_by_country("Mexico")
puts query.bathtubs_of_wine_by_country("Mexico")
puts query.bathtubs_of_spirit_by_country("Mexico")

puts query.most_beer_total
puts query.most_wine_total
puts query.most_spirit_total
puts query.most_beer_per_person
puts query.most_wine_per_person
puts query.most_spirit_per_person

puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
