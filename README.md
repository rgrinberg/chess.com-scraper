# ChessCom

Crawl chess.com api

## Installation

Add this line to your application's Gemfile:

    gem 'chess_com'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chess_com

## Usage

```
game = ChessCom::GameListing.new(username: "karpov")
game.games.each do |game|
  puts game.game_id
end
game.players.each do |player|
  puts "#{game.username} played against #{player}"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
