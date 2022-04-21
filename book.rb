require './item'
require './label'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state, id = -1)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'book' => {
        'publisher' => @publisher,
        'publish_date' => @publish_date,
        'cover_state' => @cover_state,
        'id' => @id,
        'label' => @label,
        'author' => @author
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['book']&.each do |key, value|
      object_variables.push(value) if %w[publisher publish_date cover_state id].include?(key)
    end
    book = new(*object_variables)
    book.label = object['book']['label']
    book
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end
