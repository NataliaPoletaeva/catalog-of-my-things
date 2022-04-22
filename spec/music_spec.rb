require './music'

describe Musicalbum do
  context 'when instantiated' do
    it 'With all parameters should return music album' do
      album = Musicalbum.new('2022-08-08', true)
      expect(album.class).to eq Musicalbum
      expect(album.on_spotify).to eq true
      expect(album.publish_date).to eq '2022-08-08'
    end
  end

  context 'when calling method move_to_archive' do
    it 'with on spotify true and older than 10 years' do
      music = Musicalbum.new(Time.local('2000-05-05'), true)
      music.move_to_archive
      expect(music.archived).to be_truthy
    end

    it 'with on spotify false and new music' do
      music = Musicalbum.new(Time.local('2022-05-05'), false)
      music.move_to_archive
      expect(music.archived).to be_falsey
    end

    it 'with on spotify true and new music' do
      music = Musicalbum.new(Time.local('2022-05-05'), true)
      music.move_to_archive
      expect(music.archived).to be_falsey
    end
  end
end
