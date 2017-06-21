require_relative '../enviornment.rb'
class Queries

  @@AVGPOOLSIZE = 63879

  def get_country_by_name(name)
    sql = "SELECT * FROM country_pop
    JOIN drinks_by_country
    ON country_pop.country_name = drinks_by_country.country
    WHERE country_pop.country_name = '#{name}'"
    attr_hash = DrinksByCountry.db.execute(sql)[0]
    Country.new(attr_hash)
  end

  def most_beer_by_volume
    sql = "SELECT * FROM country_pop
    JOIN drinks_by_country ON country_pop.country_name = drinks_by_country.country
    ORDER BY (country_pop.population * drinks_by_country.beer_servings) DESC LIMIT 1"
    attr_hash = DrinksByCountry.db.execute(sql)[0]
    most_beer_country = Country.new(attr_hash)
    puts "The country that drinks the most beer is #{most_beer_country.name}"
    puts "They drink #{most_beer_country.liters_of_beer} liters of beer every year"
  end

  def pop_of_china
    sql = "SELECT * FROM country_pop WHERE country_name = 'China'"
    DrinksByCountry.db.execute(sql)
  end

  def pools_of_beer_by_country(country_name)
    country = get_country_by_name(country_name)
    pools = country.pools_of_beer.to_i
    puts "#{country.name} drinks a total of #{pools} pools of beer every year...WOA"
  end

  def bathtubs_of_beer_by_country(country_name)

  end

  def central_park_lakes_of_beer_by_country(country_name)
    country = get_country_by_name(country_name)
    lakes = country.central_park_lakes_of_beer
    puts "#{country.name} drinks a total #{lakes} central park lakes of beer every year."
  end

  def pools_of_wine_by_country(country_name)

  end

  def bathtubs_of_wine_by_country(country_name)

  end

  def central_park_lakes_of_wine_by_country(country_name)

  end

  def pools_of_spirits_by_country(country_name)

  end

  def bathtubs_of_spirits_by_country(country_name)

  end

  def central_park_lakes_of_spirits_by_country(country_name)

  end


end


query = Queries.new

# query.pools_of_beer_by_country("Canada")
query.central_park_lakes_of_beer_by_country("China")
# puts query.pop_of_china
