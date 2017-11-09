require './card'

class Deck

	attr_accessor :player

	def initialize(player)
		@player = player
		@stackOfCards = []

		ranks = %w{2 3 4 5 6 7 8 9 10 J Q K A}
		suits = %w{Spades Hearts Diamonds Clubs}
		suits.each do |suit|
  			ranks.size.times do |i|
  				@stackOfCards << Card.new(ranks[i], suit, i+1)
   			end
		end
	end


 	def split()
 		player1 = []
 		player2 = []
 		shuffled = @stackOfCards.shuffle
 		shuffled.each_with_index do |num, i|
 			if ((i+ 1) % 2) == 0
 				player1.push(shuffled[i])
 			end
 			if ((i + 1) % 2) == 1
 				player2.push(shuffled[i])
 			end
 		end
 		return player1, player2
 	end

 	

end
