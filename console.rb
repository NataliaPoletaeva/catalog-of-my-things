module Console
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
end
