require './genre'

describe Genre do
  context 'when instantiated' do
    it 'with publisher, publish_date and cover_state should create a genre' do
      genre = Genre.new('Afro')
      expect(genre.class).to eq Genre
    end
  end

  it 'Name should create a genre' do
    genre = Genre.new('Afro Beats')
    expect(genre.class).to eq Genre
  end

  it 'with publisher, publish_date and cover_state should create a genre' do
    genre = Genre.new('No Genre')
    expect(genre.class).to eq Genre
    expect(genre.name).to eq nil
  end
end
