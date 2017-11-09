class Hand

	attr_accessor :name, :cards

	def initialize(name, cards)
		@name = name
		@cards = cards
	end

	def top_card
		top_card = cards[0]
		cards.shift
		return top_card
	end

	def add_card(card)
		cards.push(card)
		puts "#{name} has #{cards.length} cards left."
	end

	def length
		return @cards.length
	end

end