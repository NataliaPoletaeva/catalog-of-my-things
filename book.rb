require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end
end
