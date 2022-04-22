class Item
  attr_reader :id, :archived, :label, :author, :genre, :source
  attr_accessor :publish_date

  def initialize(publish_date, id = -1)
    @id = if id == -1
            Random.rand(1..10_000)
          else
            id
          end
    @publish_date = publish_date
    @archived = false
    @label = nil
    @author = nil
    @genre = nil
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?()
    return true if (Time.now.year - @publish_date.year) > 10

    false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
