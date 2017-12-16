class GamesLocation
  attr_reader :range, :lat, :lng

  def initialize(range = 100000000, lat, lng)
    @range = range
    @lat = lat
    @lng = lng
  end

  def nearby
    users_location = fetch_location
    games = Game.where(user_id: users_location.map{ |loc| loc[:user_id] }).
                 to_a.map(&:serializable_hash)
    games =
      games.map { |game| game.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo} }

    games.each do |game|
      game.merge!(users_location.detect { |loc| loc[:user_id] == game[:user_id] })
    end

    games.map { |game| { game: game } }
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