require 'json'

module PreserveData
  def persist_data(books, labels)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_data(books, './data/books') unless books.empty?
    save_data(labels, './data/labels') unless labels.empty?
  end

  private

  def save_data(items, file_name)
    File.write("#{file_name}.json", JSON[items])
  end
end
