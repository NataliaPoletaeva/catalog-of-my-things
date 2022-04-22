require './item'

class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color, id = -1)
    @id = if id == -1
            Random.rand(1..10_000)
          else
            id
          end
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'label' => {
        'title' => @title,
        'color' => @color,
        'id' => @id
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['label'].each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end
end
