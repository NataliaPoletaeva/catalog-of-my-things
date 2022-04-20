require './console'
require './label'
require './book'

class App
  include Console
  def initialize
    @books = []
    @labels = []
  end

  def list_books
    puts 'No books are available currently!' if @books.empty?
    @books.each_with_index do |book, indx|
      puts "#{indx + 1} ) [Book] Id: #{book.id}, publisher: #{book.publisher}, cover-state: #{book.cover_state}
            Label: title: #{book.label.title} color: #{book.label.color}"
    end
  end

  def list_labels
    puts 'No labels are available currently!'
    @labels.each_with_index { |label, indx| p indx + 1, label }
  end
end
