require './item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify,publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end
