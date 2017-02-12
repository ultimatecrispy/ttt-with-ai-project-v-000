require 'pry'
require_relative "../config/environment.rb"

class Board
	attr_accessor :board, :cells

	def initialize
		@cells = Array.new(9," ")
	end
  
  	def reset!
  		cells.replace([" "," "," "," "," "," "," "," "," "])
  	end

  	def display
  		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
  		puts "-----------"
  		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
  		puts "-----------"
  		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  	end

  	def convert_to_index(position_input)
  		position_input.to_i - 1	
  	end

  	def position(input)		
  		self.cells[convert_to_index(input)]
  	end

  	def full?
  		self.cells.detect{|c| c == " "} ? false : true
  	end

  	def turn_count
  		count = []
  		self.cells.collect{|c| count << c if c != " "}
  		count.length
  	end

  	def taken?(position_input)
  		# position method will convert input to index
  		self.position(position_input) != " "
  	end

  	def valid_move?(position_input)
  		/[1-9]/.match(position_input) ? !self.taken?(position_input) : false
  	end

  	def update(position_input, player)
  		if self.valid_move?(position_input)
  			self.cells[convert_to_index(position_input)] = player.token
  		end	
  	end
end