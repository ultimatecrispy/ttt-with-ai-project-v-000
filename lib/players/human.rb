require_relative "../../config/environment.rb"

module Players
	class Human < Player
		def move(board)
			puts "Enter your move: "
			move_input = gets.chomp
		end
	end
end