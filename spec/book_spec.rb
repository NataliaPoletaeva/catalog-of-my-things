require './book'

describe Book do
  context 'when instantiated' do
    it 'with publisher, publish_date and cover_state should create a book' do
      book = Book.new('Printice Hall', '2002-05-05', 'bad')
      expect(book.class).to eq Book
      expect(book.publisher).to eq 'Printice Hall'
      expect(book.publish_date).to eq '2002-05-05'
    end
  end

  context 'when calling method move_to_archive' do
    it 'with old book and \'bad\' cover_state, should set archived property of book to true' do
      book = Book.new('Printice Hall', Time.local('2000-05-05'), 'bad')
      book.move_to_archive
      expect(book.archived).to be_truthy
    end

    it 'with new book and new cover_state, should leave archived as false by default' do
      book = Book.new('Printice Hall', Time.local('2015-05-05'), 'new')
      book.move_to_archive
      expect(book.archived).to be_falsey
    end

    it 'with new book but \'bad\' cover_state, should set archived property true' do
      book = Book.new('Printice Hall', Time.local('2015-05-05'), 'bad')
      book.move_to_archive
      expect(book.archived).to be_truthy
    end
  end
end
