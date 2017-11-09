require './game'
require './deck'
require './pot'
require './card'
require './hand'


deck1 = Deck.new("main")

game = Game.new(deck1)

game.turn