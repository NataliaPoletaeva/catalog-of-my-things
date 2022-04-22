require './item'
require './label'
require './author'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :publish_date

  def initialize(multiplayer, last_played_date, publish_date, id = -1)
    super(publish_date, id)
    @last_played_date = last_played_date
    @multiplayer = multiplayer
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'game' => {
        'multiplayer' => @multiplayer,
        'last_played_date' => @last_played_date,
        'publish_date' => @publish_date,
        'id' => @id,
        'label' => @label,
        'author' => @author
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['game']&.each do |key, value|
      object_variables.push(value) if %w[multiplayer last_played_date publish_date id].include?(key)
    end
    game = new(*object_variables)
    game.label = object['game']['label']
    game.author = object['game']['author']
    game
  end

  private

  def can_be_archived?
    return true if super && (Time.new.year - @last_played_date.year > 2)

    false
  end
end
