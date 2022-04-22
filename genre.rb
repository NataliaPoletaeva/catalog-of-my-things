require './item'

class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name, id = -1)
    @id = if id == -1
            Random.rand(1..10_000)
          else
            id
          end
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'genre' => {
        'name' => @name,
        'id' => @id
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['genre'].each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end
end
