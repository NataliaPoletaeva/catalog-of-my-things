require './item'

class Genre < Item
  attr_accessor :on_spotify

  def initialize(_name, _id, _items)
    super(publish_date)
  end

  private

  def can_be_archived?
    false
  end
end
