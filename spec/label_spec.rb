require './label'
require './item'

describe Label do
  context 'when instantiated with title and color' do
    it 'should create a label object' do
      blue_gift_label = Label.new('Gift', 'Blue')
      expect(blue_gift_label.id).to be_between(1, 10_000)
      expect(blue_gift_label.title).to eq 'Gift'
      expect(blue_gift_label.color).to eq 'Blue'
      expect(blue_gift_label.items.length).to be_zero
    end
  end

  context 'when calling method add_item with book object' do
    it 'should create a label object and assign it to the book' do
      label = Label.new('Gift', 'Blue')
      book = Book.new('Printice Hall', '2002-05-05', 'bad')
      label.add_item(book)
      expect(label.items.length).to be > 0
      expect(book.label).to eq label
      expect(label.items[0]).to eq book
    end
  end
end
