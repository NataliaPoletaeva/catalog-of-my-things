require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :publish_date

  def initialize(multiplayer, last_played_date, publish_date)
    super(publish_date)
    @last_played_date = last_played_date
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Date.now.year - Date.parse(last_played_date).year > 2)
  end
end
