module Console
  def user_options
    puts
    puts ['1 - Add a book', '2 - Add a music album',
          '3 - Add a game', '4 - List all books',
          '5 - List all music albums', '6 - List all games',
          '7 - List all genres (e.g "Comedy", "Thriller")', '8 - List all labels (e.g. "Gift", "New")',
          '9 - List all authors (e.g. "Stephen King")', 'E - Exit']
  end

  def label_input
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    { title: title, color: color }
  end

  def author_input
    print 'Enter author`s first name: '
    first_name = gets.chomp
    print 'Enter author`s last name: '
    last_name = gets.chomp
    { first_name: first_name, last_name: last_name }
  end

  def musicalbum_input
    print 'Enter a music album publish date:'
    publish_date = gets.chomp
    print 'Is it on spotify (y/n)'
    on_spotify = gets.chomp
    { publish_date: publish_date, on_spotify: on_spotify }
  end

  def genre_input
    print 'Enter a genre:'
    name = gets.chomp
    { name: name }
  end

  def book_input
    print 'Enter book publisher: '
    publisher = gets.chomp
    print 'Enter book published date: '
    publish_date = gets.chomp
    print 'Enter book cover state: '
    cover_state = gets.chomp
    { publisher: publisher, publish_date: publish_date, cover_state: cover_state }
  end

  def game_input
    print 'Enter if the game has multiplayer [Y/N]: '
    multiplayer = gets.chomp
    print 'Enter the date when you last played the game: '
    last_played_date = gets.chomp
    print 'Enter game publish date: '
    publish_date = gets.chomp
    { multiplayer: multiplayer, last_played_date: last_played_date, publish_date: publish_date }
  end

  def display_books(books)
    puts 'No books are available currently!' if @books.empty?
    books.each_with_index do |book, indx|
      puts "#{indx + 1} ) [Book] Id: #{book.id}, publisher: #{book.publisher}, cover-state: #{book.cover_state}
            Label: Title: #{book.label.title}, Color: #{book.label.color}
            Author: #{book.author.first_name} #{book.author.last_name}"
    end
  end

  def display_games(games)
    puts 'No games are available currently!' if @games.empty?
    games.each_with_index do |game, indx|
      puts "#{indx + 1} ) [Game] Id: #{game.id}, multiplayer: #{game.multiplayer},
      last time played: #{game.last_played_date}, publish date: #{game.publish_date}
      Label: Title: #{game.label.title}, Color: #{game.label.color}
      Author: #{game.author.first_name} #{game.author.last_name}"
    end
  end

  def display_musicalbums(musicalbums)
    puts 'No music albums available!' if @musicalbums.empty?
    musicalbums.each_with_index do |musicalbum, indx|
      puts "#{indx + 1} ) [Musicalbum] Id: #{musicalbum.id}, On Spotify: #{musicalbum.on_spotify},
      publish date: #{musicalbum.publish_date}
      Label: Title: #{musicalbum.label.title}, Color: #{musicalbum.label.color}
      Genre: Name: #{musicalbum.genre.name}
      Author: #{musicalbum.author.first_name} #{musicalbum.author.last_name}"
    end
  end

  def display_labels(labels)
    puts 'No labels are available currently!' if @labels.empty?
    labels.each_with_index do |label, indx|
      puts " #{indx + 1} ) [Label] Id: #{label.id}, Title: #{label.title}, Color: #{label.color}"
    end
  end

  def display_authors(authors)
    puts 'No authors are available currently!' if @authors.empty?
    authors.each_with_index do |author, indx|
      puts "#{indx + 1} ) [Author] Id: #{author.id}, Name: #{author.first_name} #{author.last_name}"
    end
  end

  def display_genres(genres)
    puts 'No genres are available currently!' if @genres.empty?
    genres.each_with_index do |genre, indx|
      puts "#{indx + 1} ) [Genre] Id: #{genre.id}, Name: #{genre.name} "
    end
  end
end
