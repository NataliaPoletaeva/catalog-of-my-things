require './item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if supper || cover_state == 'bad'

    false
  end
end
