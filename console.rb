module Console
  def label_input
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    { title: title, color: color }
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
end
