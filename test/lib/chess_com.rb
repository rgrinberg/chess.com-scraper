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
    @game = ChessCom::GameListing.new(username: @user)
  end
  it 'can fetch a game listing' do
    (@game.games.size > 0).must_equal true
  end
  it 'can detect multiple pages' do
    (@game.pages.size > 0).must_equal true
  end

  it 'returns pages which are integers' do
    @game.pages.each do |page|
      assert page.is_a? Integer
    end
  end

  it 'does not include its own page' do
    refute @game.pages.include? @game.page
  end
  it 'can detect other players' do
    (@game.players.size > 0).must_equal true
    refute @game.players.include? @game.username
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
