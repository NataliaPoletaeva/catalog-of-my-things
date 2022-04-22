require './item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = -1)
    @id = if id == -1
            Random.rand(1..10_000)
          else
            id
          end
    super(publish_date, id)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'musicalbum' => {
        'publish_date' => @publish_date,
        'on_spotify' => @on_spotify,
        'id' => @id,
        'label' => @label,
        'author' => @author,
        'genre' => @genre
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['musicalbum']&.each do |key, value|
      object_variables.push(value) if %w[publish_date on_spotify id].include?(key)
    end
    musicalbum = new(*object_variables)
    musicalbum.label = object['musicalbum']['label']
    musicalbum.author = object['musicalbum']['author']
    musicalbum.genre = object['musicalbum']['genre']
    musicalbum
  end

  private

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end
