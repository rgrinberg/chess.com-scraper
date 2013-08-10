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
    (listing.players.size > 0).must_equal true
    refute listing.players.include? @user
  end
end

class FakeLink
  def initialize(href)
    @href = href
  end
  def attribute att
    return @href
  end
end

describe ChessCom::GameListing do
  it 'should fucking work' do
    links = %w{google.com yahoo.net canada.ca bs}.map { |h| FakeLink.new h }
    urls = ChessCom.select_if_match(links, /.+\..+/) do |url, text|
      /.+\.(?<com>.+)/.match(url)[:com]
    end
    urls.must_equal %w{com net ca}
  end
end
