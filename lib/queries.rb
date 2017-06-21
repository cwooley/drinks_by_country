require_relative '../enviornment.rb'
class Queries
  # AVG POOL SIZE 15x 30 16,875 galleons volume = 63879 liters
  # Lake George has 550 billion gallons of water maybe we can compare by that too depending on quantity
  @@AVGPOOLSIZE = 63879
  def most_beer
    DrinksByCountry.most_beer
  end

  def pools_of_beer_by_country(country)

  end

  def bathtubs_of_beer_by_country(country)

  end

  def lake_georges_of_beer_by_country(country)

  end

  def pools_of_wine_by_country(country)

  end

  def bathtubs_of_wine_by_country(country)

  end

  def lake_georges_of_wine_by_country(country)

  end

  def pools_of_spirits_by_country(country)

  end

  def bathtubs_of_spirits_by_country(country)

  end

  def lake_georges_of_spirits_by_country(country)

  end


end


query = Queries.new

puts query.most_beer
