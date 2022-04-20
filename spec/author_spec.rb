require './author'
require './game'

describe Author do
  it 'Create new author' do
    stephen_king = Author.new('Stephen', 'King')
    expect(stephen_king.id).to be_between(1, 10_000)
    expect(stephen_king.first_name).to eq 'Stephen'
    expect(stephen_king.last_name).to eq 'King'
    expect(stephen_king.items.length).to be_zero
  end

  it 'Create an author object and assign it to the game' do
    author = Author.new('Cai', 'Haoyu')
    game = Game.new(true, '2022-20-04', '2020-28-09')
    author.add_item(game)
    expect(author.items.length).to be > 0
    expect(game.author).to eq author
    expect(author.items[0]).to eq game
  end
end
