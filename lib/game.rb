require_relative "../config/environment.rb"

class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2],
						[3,4,5],
						[6,7,8],
						[0,3,6],
						[1,4,7],
						[2,5,8],
						[0,4,8],
						[6,4,2]]					

	#could be metaprogrammed to accept arguments in any order
	def initialize(player1_object=Players::Human.new("X"), player2_object=Players::Human.new("O"), board_object=Board.new)
		@player_1 = player1_object	
		@player_2 = player2_object
		@board = board_object
	end

	def current_player
		if board.turn_count.even?
			Player.all.detect {|player| player.token == "X"}
		else
			Player.all.detect {|player| player.token == "O"}
		end
	end

	def over?
		board.full? || self.won?
	end

	def won?
		self.winner == "X" || self.winner == "O"
	end

	def draw?
		board.full? && self.won? == false
	end

	def winner
		if WIN_COMBINATIONS.collect {|combo| combo.all? {|c| board.cells[c] == "X" }}.include?(true)
			"X"
		elsif WIN_COMBINATIONS.collect {|combo| combo.all? {|c| board.cells[c] == "O" }}.include?(true)	
			"O"
		end
	end

	def turn
		puts "Please enter a position number (between 1 through 9):"
		gets
		# $stdin.gets
		# ARGV.clear
	end

	# def winning_line
	# 	winning_index = WIN_COMBINATIONS.collect {|combo| combo.all? {|c| game.board.cells[c] == "X" }}.rindex(true)
	# 	WIN_COMBINATIONS[winning_index].collect{|i| i+1} #converts to user positions
	# end
end