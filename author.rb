require './item'

class Author
  attr_reader :first_name, :last_name, :id
  attr_accessor :items

  def initialize(first_name, last_name, id = -1)
    @id = if id == -1
            Random.rand(1..10_000)
          else
            id
          end
    @items = []
    @first_name = first_name.strip
    @last_name = last_name.strip
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'author' => {
        'first_name' => @first_name,
        'last_name' => @last_name,
        'id' => @id
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['author'].each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end
end
