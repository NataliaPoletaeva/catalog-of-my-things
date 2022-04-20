require './game'

describe Game do
  it 'Create new game with all the properties' do
    game = Game.new(true, '2022-20-04', '2020-28-09')
    expect(game.class).to eq Game
    expect(game.multiplayer).to eq true
    expect(game.last_played_date).to eq '2022-20-04'
  end

  it 'Move to archive because the game was not played for a while' do
    game = Game.new(true, Time.local('2019-15-04'), '2019-28-09')
    game.move_to_archive
    expect(game.archived).to be_truthy
  end

  it 'Leave the game because it is played' do
    game = Game.new(true, Time.local('2021-15-04'), '2019-28-09')
    game.move_to_archive
    expect(game.archived).to be_falsy
  end
end
