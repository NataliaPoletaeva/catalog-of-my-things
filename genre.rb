require './item'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(_name)
    @id = Random.rand(1..10_00)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
