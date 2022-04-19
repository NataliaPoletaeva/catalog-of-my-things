class Item
  attr_reader :id, :archived
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?()
    return true if(@publish_date.year - Time.now.year) > 10
    false
  end

  def move_to_archive()
   @archived = true if can_be_archived?
  end
  
end
