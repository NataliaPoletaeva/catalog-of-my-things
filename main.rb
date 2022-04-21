require './app'

class MainEntryPoint
  def user_options
    puts
    puts 'Hello! What would you like to do today?'
    puts ['1 - List all books', '2 - List all music albums', '3 - List all movies',
          '4 - List of games', '5 - List all genres (e.g "Comedy", "Thriller")',
          '6 - List all labels (e.g. "Gift", "New")', '7 - List all authors (e.g. "Stephen King")',
          '8 - List all sources (e.g. "From a friend", "Online shop")',
          '9 - Add a book', '10 - Add a music album', '11 - Add a movie', '12 - Add a game', 'E - Exit']
  end

  def run_app
    app = App.new

    user_input = nil
    puts 'Hello! What would you like to do today?'

    while user_input != 'E'
      user_options
      user_input = gets.chomp
      case user_input
      when '1' then app.list_books
      when '6' then app.list_labels
      when '9' then app.create_book
      when 'E' then 
        puts 'Saving data in JSON files....'
        app.preserve_data_to_json
      end
    end
  end
end

def main
  app = MainEntryPoint.new
  app.run_app
end

main
