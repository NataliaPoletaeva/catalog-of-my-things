require './console'
require './preserve_data'
require './label'
require './book'

class App
  include Console
  include PreserveData

  def initialize
    @books = retrieve_data('books')
    @labels = retrieve_data('labels')
  end

  def list_books
    puts 'No books are available currently!' if @books.empty?
    @books.each_with_index do |book, indx|
      puts "#{indx + 1} ) [Book] Id: #{book.id}, publisher: #{book.publisher}, cover-state: #{book.cover_state}
            Label: Title: #{book.label.title}, Color: #{book.label.color}"
    end
  end

  def list_labels
    puts 'No labels are available currently!' if @labels.empty?
    @labels.each_with_index do |label, indx|
      puts "#{indx + 1} ) [Label] Id: #{label.id}, Title: #{label.title}, Color: #{label.color}"
    end
  end

  def create_label
    user_input = label_input
    label = Label.new(user_input[:title], user_input[:color])
    @labels << label
    label
  end

  def add_label_to_item
    puts 'Add label:
      1 - select from existing labels
      2 - create new label'
    label_source = gets.chomp
    label = nil
    case label_source
    when '1'
      list_labels
      if @labels.empty?
        puts 'No labels avail. Please, create label!'
        label = create_label
      else
        print 'Enter the number on the left to select a label: '
        label_index = gets.chomp.to_i
        label = @labels[label_index - 1]
      end
    when '2' then label = create_label
    end
    label
  end

  def create_book
    user_input = book_input
    label = add_label_to_item
    book = Book.new(
      user_input[:publisher],
      user_input[:publish_date],
      user_input[:cover_state]
    )
    label&.add_item(book)
    @books << book
    book
  end

  def preserve_data_to_json
    persist_data(@books, @labels)
  end
end
