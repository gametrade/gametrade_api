class GamesLocation
  attr_reader :range, :lat, :lng

  def initialize(range, lat, lng)
    @range = range
    @lat = lat
    @lng = lng
  end

  def nearby(limit = nil)
    users_location = fetch_location
    games = Game.where(user_id: users_location.map{ |loc| loc[:user_id] }).
                 to_a.map(&:serializable_hash)
    games =
      games.map { |game| game.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo} }
  
    binding.pry
    games
  end

  private

  def fetch_location
    locations =
      Address.within_radius(range, lat, lng).
              order_by_distance(lat, lng).
              selecting_distance_from(lat, lng)

    locations.map do |item|
      { user_id: item.user_id, distance: item.distance }
    end
  end
end