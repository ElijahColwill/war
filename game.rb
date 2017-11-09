require './deck'
require './card'
require './pot'
require './hand'

class Game

	attr_accessor :deck1 

	def initialize(deck1)
		@deck1 = deck1
		@player1 = []
		@player2 = []
		player1, player2 = deck1.split()
		@hand_1 = Hand.new("Player 1", player1)
		@hand_2 = Hand.new("Player 2", player2)
		@pot = Pot.new()
	end

	def turn()
		while @hand_1.length > 0 and @hand_2.length > 0
			tie = true
			while tie
				@pot.add_card(@hand_1.top_card, 1)
				@pot.add_card(@hand_2.top_card, 2)

				result = @pot.battle

				if result == 0
					@pot.add_player(1, @hand_1)
					tie = false
				elsif result == 1
					@pot.add_player(2, @hand_2)
					tie = false
				elsif result == 2
					if @hand_1.length > 2 and @hand_2.length > 2
						@pot.add_card(@hand_1.top_card, 1)
						@pot.add_card(@hand_1.top_card, 1)
						@pot.add_card(@hand_2.top_card, 2)
						@pot.add_card(@hand_2.top_card, 2)
					else
						break
					end
				end
			end

			@pot.clear_pot
	
		end

		puts "---"
		if @hand_1.length == 0
			puts "Player 2 Wins!!"
			puts "Player 2 has #{@hand_2.length} cards."
			puts "Player 1 has #{@hand_1.length} cards."
		else
			puts "Player 1 Wins!!"
			puts "Player 2 has #{@hand_2.length} cards."
			puts "Player 1 has #{@hand_1.length} cards."
		end

	end

end