require './console'
require './preserve_data'
require './command_options'
require './label'
require './book'
require './author'
require './game'
require './music'
require './genre'

class App
  include Console
  include PreserveData
  include CommandOptions

  def initialize
    @authors = retrieve_data('authors')
    @games = retrieve_data('games')
    @books = retrieve_data('books')
    @labels = retrieve_data('labels')
    @musicalbums = retrieve_data('musicalbums')
    @genres = retrieve_data('genres')
  end

  def create_label
    user_input = label_input
    label = Label.new(user_input[:title], user_input[:color])
    @labels << label
    label
  end

  def create_genre
    user_input = genre_input
    genre = Genre.new(user_input[:name])
    @genres << genre
    genre
  end

  def create_author
    user_input = author_input
    author = Author.new(
      user_input[:first_name],
      user_input[:last_name]
    )
    @authors << author
    author
  end

  def add_label_to_item
    puts "Add label: \n1 - select from existing labels \n2 - create new label"
    label_source = gets.chomp
    label = nil
    case label_source
    when '1'
      list_labels
      if @labels.empty?
        puts 'No labels available. Please, create label!'
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

  def add_author_to_item
    puts "Add author: \n1 - select from existing authors \n2 - add new author"
    author_source = gets.chomp
    author = nil
    case author_source
    when '1'
      list_authors
      if @authors.empty?
        puts 'No authors available. Please, add authors!'
        author = create_author
      else
        print 'Enter the number to select an author: '
        author_index = gets.chomp.to_i
        author = @authors[author_index - 1]
      end
    when '2' then author = create_author
    end
    author
  end

  def add_genre_to_item
    puts "Add genre: \n1 - select from existing genres \n2 - add new genre"
    genre_option = gets.chomp
    genre = nil
    case genre_option
    when '1'
      list_genres
      if @genres.empty?
        puts 'No genres available. Please, add genre!'
        genre = create_genre
      else
        print 'Enter the number to select genre: '
        genre_index = gets.chomp.to_i
        genre = @genres[genre_index - 1]
      end
    when '2' then genre = create_genre
    end
    genre
  end

  def create_book
    input = book_input
    label = add_label_to_item
    author = add_author_to_item
    genre = add_genre_to_item
    book = Book.new(input[:publisher], input[:publish_date], input[:cover_state])
    label.add_item(book)
    author.add_item(book)
    genre.add_item(book)
    @books << book
    book
  end

  def create_musicalbum
    input = musicalbum_input
    genre = add_genre_to_item
    label = add_label_to_item
    author = add_author_to_item
    musicalbum = Musicalbum.new(input[:publish_date], input[:on_spotify])
    genre.add_item(musicalbum)
    label.add_item(musicalbum)
    author.add_item(musicalbum)
    @musicalbums << musicalbum
    musicalbum
  end

  def create_game
    input = game_input
    label = add_label_to_item
    author = add_author_to_item
    game = Game.new(input[:multiplayer], input[:last_played_date], input[:publish_date])
    label.add_item(game)
    author.add_item(game)
    @games << game
    game
  end

  def list_books
    display_books(@books)
  end

  def list_games
    display_games(@games)
  end

  def list_musicalbums
    display_musicalbums(@musicalbums)
  end

  def list_labels
    display_labels(@labels)
  end

  def list_authors
    display_authors(@authors)
  end

  def list_genres
    display_genres(@genres)
  end

  def preserve_data_to_json
    persist_data(@books, @games, @labels, @authors)
  end

  def options(user_input)
    if user_input.to_i >= 1 && user_input.to_i <= command_options.length then send(command_options[user_input.to_i - 1])
    elsif user_input == 'E' then preserve_data_to_json
    end
  end

  def run_app
    user_input = nil
    puts 'Hello! What do you want to do today?'
    while user_input != 'E'
      user_options
      user_input = gets.chomp
      options(user_input)
    end
  end
end
