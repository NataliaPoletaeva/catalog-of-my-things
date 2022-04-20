require './item'

class Author
  attr_reader :first_name, :last_name, :id
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @items = []
    @first_name = first_name.strip
    @last_name = last_name.strip
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
