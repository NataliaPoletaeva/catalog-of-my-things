require './console'
require './preserve_data'
require './label'
require './book'
require './author'
require './game'
require './music'
require './genre'

class App
  include Console
  include PreserveData

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
    puts 'Add label:
    1 - select from existing labels
    2 - create new label'
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
    puts 'Add author:
    1 - select from existing authors
    2 - add new author'
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
    puts 'Add genre:
    1 - select from existing genres
    2 - add new genre'
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
    user_input = book_input
    label = add_label_to_item
    author = add_author_to_item
    book = Book.new(
      user_input[:publisher],
      user_input[:publish_date],
      user_input[:cover_state]
    )
    label.add_item(book)
    author.add_item(book)
    @books << book
    book
  end

  def create_musicalbum
    user_input = musicalbum_input
    genre = add_genre_to_item
    label = add_label_to_item
    author = add_author_to_item
    musicalbum = Musicalbum.new(
      user_input[:publish_date],
      user_input[:on_spotify]
    )
    genre.add_item(musicalbum)
    label.add_item(musicalbum)
    author.add_item(musicalbum)
    @musicalbums.push(musicalbum)
    musicalbum
  end

  def create_game
    user_input = game_input
    label = add_label_to_item
    author = add_author_to_item
    game = Game.new(
      user_input[:multiplayer],
      user_input[:last_played_date],
      user_input[:publish_date]
    )
    label.add_item(game)
    author.add_item(game)
    @games << game
    game
  end

  def list_books
    puts 'No books are available currently!' if @books.empty?
    @books.each_with_index do |book, indx|
      puts "#{indx + 1} ) [Book] Id: #{book.id}, publisher: #{book.publisher}, cover-state: #{book.cover_state}
            Label: Title: #{book.label.title}, Color: #{book.label.color}
            Author: #{book.author.first_name} #{book.author.last_name}"
    end
  end

  def list_games
    puts 'No games are available currently!' if @games.empty?
    @games.each_with_index do |game, indx|
      puts "#{indx + 1} ) [Game] Id: #{game.id}, multiplayer: #{game.multiplayer},
      last time played: #{game.last_played_date}, publish date: #{game.publish_date}
      Label: Title: #{game.label.title}, Color: #{game.label.color}
      Author: #{game.author.first_name} #{game.author.last_name}"
    end
  end

  def list_musicalbums
    puts 'No music albums available!' if @musicalbums.empty?
    @musicalbums.each_with_index do |musicalbum, indx|
      puts "#{indx + 1} ) [Musicalbum] Id: #{musicalbum.id}, On Spotify: #{musicalbum.on_spotify},
      publish date: #{musicalbum.publish_date}
      Label: Title: #{musicalbum.label.title}, Color: #{musicalbum.label.color}
      Genre: Name: #{musicalbum.genre.name}
      Author: #{musicalbum.author.first_name} #{musicalbum.author.last_name}"
    end
  end

  def list_labels
    puts 'No labels are available currently!' if @labels.empty?
    @labels.each_with_index do |label, indx|
      puts " #{indx + 1} ) [Label] Id: #{label.id}, Title: #{label.title}, Color: #{label.color}"
    end
  end

  def list_authors
    puts 'No authors are available currently!' if @authors.empty?
    @authors.each_with_index do |author, indx|
      puts "#{indx + 1} ) [Author] Id: #{author.id}, Name: #{author.first_name} #{author.last_name}"
    end
  end

  def list_genres
    puts 'No genres are available currently!' if @genres.empty?
    @genres.each_with_index do |genre, indx|
      puts "#{indx + 1} ) [Genre] Id: #{genre.id}, Name: #{genre.name} "
    end
  end

  def preserve_data_to_json
    persist_data(@books, @games, @labels, @authors)
  end
end
