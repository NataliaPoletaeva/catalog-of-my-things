require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :publish_date

  def initialize(multiplayer, last_played_date, publish_date)
    super(publish_date)
    @last_played_date = last_played_date
    @multiplayer = multiplayer
  end
end
