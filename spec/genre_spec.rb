require './genre'

describe Genre do
  context 'when instantiated' do
    it 'should create a genre' do
      genre = Genre.new('Afro')
      expect(genre.class).to eq Genre
      expect(genre.id).to be_between(1, 10_000)
    end
  end

  it 'Name should create a genre' do
    genre = Genre.new('Afro Beats')
    expect(genre.class).to eq Genre
    expect(genre.name).to eq 'Afro Beats'
  end
end
