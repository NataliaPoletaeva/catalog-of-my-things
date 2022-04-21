require './app'

class MainEntryPoint
  def user_options
    puts
    puts ['1 - Add a book', '2 - Add a music album',
          '3 - Add a game', '4 - List all books',
          '5 - List all music albums', '6 - List all games',
          '7 - List all genres (e.g "Comedy", "Thriller")', '8 - List all labels (e.g. "Gift", "New")',
          '9 - List all authors (e.g. "Stephen King")', 'E - Exit']
  end

  def run_app
    app = App.new

    user_input = nil
    puts 'Hello! What would you like to do today?'

    while user_input != 'E'
      user_options
      user_input = gets.chomp
      case user_input
      when '1' then app.add_book
      when '3' then app.add_game
      when '4' then app.list_books
      when '6' then app.list_games
      when '8' then app.list_labels
      when '9' then app.list_authors
      when 'E'
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
