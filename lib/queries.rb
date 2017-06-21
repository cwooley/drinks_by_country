require_relative '../enviornment.rb'
class Queries

  def get_country_by_name(name)
    sql = "SELECT * FROM countries
      JOIN drinks_by_country ON countries.id = drinks_by_country.country_id
      JOIN drinks ON drinks_by_country.drink_id = drinks.id
      WHERE countries.name = '#{name}' LIMIT 4"
      hash_arr = DrinksByCountry.db.execute(sql)
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
    puts "#{country.name} drinks a total of #{pools} pools of beer every year."
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
    puts "#{country.name} drinks a total of #{pools} pools of wine every year."
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
    puts "#{country.name} drinks a total of #{pools} pools of spirits every year."
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

  end

  def most_wine_total

  end

  def most_spirit_total

  end

  ###question "who drinks the most beer/wine/spirits per captia?"

  def most_beer_per_person

  end

  def most_wine_per_person

  end

  def most_spirit_per_person

  end
end


query = Queries.new

query.pools_of_beer_by_country("Canada")
query.pools_of_wine_by_country("Canada")
query.pools_of_spirit_by_country("Canada")

query.central_park_lakes_of_beer_by_country("Germany")
query.central_park_lakes_of_wine_by_country("Germany")
query.central_park_lakes_of_spirit_by_country("Germany")

query.bathtubs_of_beer_by_country("Mexico")
query.bathtubs_of_wine_by_country("Mexico")
query.bathtubs_of_spirit_by_country("Mexico")

puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
