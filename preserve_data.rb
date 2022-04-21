require 'json'

module PreserveData
  def persist_data(books, games, labels, authors)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_data(books, './data/books') unless books.empty?
    save_data(games, './data/games') unless games.empty?
    save_data(labels, './data/labels') unless labels.empty?
    save_data(authors, './data/authors') unless authors.empty?
  end

  def retrieve_data(path)
    return [] unless File.exist?("./data/#{path}.json")

    read_file("./data/#{path}.json")
  end

  private

  def save_data(items, file_name)
    File.write("#{file_name}.json", JSON[items])
  end

  def read_file(file_name)
    file_data = File.read(file_name)
    JSON.parse(file_data, create_additions: true)
  end
end
