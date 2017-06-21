require_relative '../enviornment.rb'
class Queries

  @@AVGPOOLSIZE = 63879

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

  def pools_of_beer_by_country(country)

  end

  def bathtubs_of_beer_by_country(country)

  end

  def central_park_lakes_of_beer_by_country(country)

  end

  def pools_of_wine_by_country(country)

  end

  def bathtubs_of_wine_by_country(country)

  end

  def central_park_lakes_of_wine_by_country(country)

  end

  def pools_of_spirits_by_country(country)

  end

  def bathtubs_of_spirits_by_country(country)

  end

  def central_park_lakes_of_spirits_by_country(country)

  end


end


query = Queries.new

query.most_beer_by_volume
# puts query.pop_of_china
