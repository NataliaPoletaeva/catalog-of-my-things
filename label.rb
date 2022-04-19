require './item'

class Label < Item
  attr_accessor :title, :color
  def initialize(title, color)
    @id = Random.rand(1..10_00)
    @title = title
    @color = color
    @items = []
  end
end
