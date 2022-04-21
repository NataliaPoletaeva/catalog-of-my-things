require './item'

class Musicalbum < Item
  attr_accessor :on_spotify, :name

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end
