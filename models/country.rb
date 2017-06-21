class Country
  attr_accessor :name, :beer_servings, :wine_servings, :spirit_servings, :population, :pure_alc

  @@AVGPOOLSIZE = 63879
  @@AVGTUBSIZE = 303
  @@CENTRALPARKRES = 3800000000

  def initialize(attr_hash)
    @name = attr_hash["name"]
    @population = attr_hash["population"]
    @beer_servings = attr_hash["beer"]
    @wine_servings = attr_hash["wine"]
    @spirit_servings =  attr_hash["spirit"]
    @pure_alc =  attr_hash["pure"]
  end

  def liters_of_beer
    # 12 oz of beer in a serving and 33.814 oz in a liter
    self.beer_servings * self.population * 12 / 33.814
  end

  def tubs_of_beer
    self.liters_of_beer / @@AVGTUBSIZE
  end

  def pools_of_beer
    self.liters_of_beer / @@AVGPOOLSIZE
  end

  def central_park_lakes_of_beer
    self.liters_of_beer / @@CENTRALPARKRES
  end

  def liters_of_wine
    # 12 oz of beer in a serving and 33.814 oz in a liter
    self.wine_servings * self.population * 5 / 33.814
  end

  def tubs_of_wine
    self.liters_of_wine / @@AVGTUBSIZE
  end

  def pools_of_wine
    self.liters_of_wine / @@AVGPOOLSIZE
  end

  def central_park_lakes_of_wine
    self.liters_of_wine / @@CENTRALPARKRES
  end

  def liters_of_spirit
    # 12 oz of beer in a serving and 33.814 oz in a liter
    self.spirit_servings * self.population * 1.5 / 33.814
  end

  def tubs_of_spirit
    self.liters_of_spirit / @@AVGTUBSIZE
  end

  def pools_of_spirit
    self.liters_of_spirit / @@AVGPOOLSIZE
  end

  def central_park_lakes_of_spirit
    self.liters_of_spirit / @@CENTRALPARKRES
  end

end
