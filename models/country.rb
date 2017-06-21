class Country
  attr_accessor :name, :beer_servings, :wine_servings, :spirit_servings, :population

  # AVG POOL SIZE 15x 30 16,875 galleons volume = 63879 liters
  # Lake George has 550 billion gallons of water maybe we can compare by that too depending on quantity
  # central park resovoir 3800000000 liters

  @@AVGPOOLSIZE = 63879

  def initialize(attr_hash)
    @name = attr_hash["country_name"]
    @beer_servings = attr_hash["beer_servings"]
    @wine_servings = attr_hash["wine_servings"]
    @spirit_servings = attr_hash["spirit_servings"]
    @population = attr_hash["population"]
  end

  def liters_of_beer
    self.beer_servings * self.population * 12 / 33.814
  end

  def pools_of_beer
    self.liters_of_beer / @@AVGPOOLSIZE
  end

  def central_park_lakes_of_beer

  end

end
