require_relative '../test_helper'

describe ChessCom::DefaultClient do
  it 'can fetch a url' do
    dc = ChessCom::DefaultClient.new
    refute_nil (dc.get "http://google.com")
  end
end

describe ChessCom::GameListing do
  before do
    @user = 'rgrinberg'
  end
  it 'can fetch a game listing' do
    listing = ChessCom::GameListing.new(username: @user)
    (listing.games.size > 0).must_equal true
  end
  it 'can detect multiple pages' do
    listing = ChessCom::GameListing.new(username: @user)
    (listing.pages.size > 0).must_equal true
  end
  it 'can detect other players' do
    listing = ChessCom::GameListing.new(username: @user)
    (listing.users.size > 0).must_equal true
  end
end
