require './hand'

class Pot

	def initialize
		@player1 = []
		@player2 = []
	end

	def add_card(card, player)
		if player == 1
			@player1.push(card)
		elsif player == 2
			@player2.push(card)
		end
	end

	def clear_pot
		@player1 = []
		@player2 = []
	end

	def battle
		if @player1[-1].value > @player2[-1].value
			puts "Player 1 wins #{@player1[-1].rank} vs #{@player2[-1].rank}!"
			return 0
		elsif @player2[-1].value > @player1[-1].value
			puts "Player 2 wins #{@player1[-1].rank} vs #{@player2[-1].rank}!"
			return 1
		elsif @player1[-1].value == @player2[-1].value
			puts "Tie! Go to war #{@player1[-1].rank} vs #{@player2[-1].rank}."
			return 2
		end
	end

	def add_player(player, hand)
		if player == 1
			@player1.each do |card|
				hand.add_card(card)
			end
		else
			@player2.each do |card|
				hand.add_card(card)
			end
		end	
	end


end