require './music'

describe Musicalbum do
  context 'when instantiated' do
    it 'with publisher, publish_date and cover_state should create a album' do
      album = Musicalbum.new('Thriller', '2002-05-05', true)
      expect(album.class).to eq Musicalbum
      expect(album.name).to eq 'Thriller'
      expect(album.on_spotify).to eq true
      expect(album.publish_date).to eq '2002-05-05'
    end
  end

  it 'with publisher, publish_date and cover_state should create a album' do
    album = Musicalbum.new('Rights', '2002-05-08', false)
    expect(album.class).to eq Musicalbum
    expect(album.name).to eq 'Rights'
    expect(album.on_spotify).to eq false
    expect(album.publish_date).to eq '2002-05-08'
  end

  it 'with publisher, publish_date and cover_state should create a album' do
    album = Musicalbum.new('The Show', '2022-08-08', true)
    expect(album.class).to eq Musicalbum
    expect(album.name).to eq 'The Show'
    expect(album.on_spotify).to eq true
    expect(album.publish_date).to eq '2022-08-08'
  end
end
