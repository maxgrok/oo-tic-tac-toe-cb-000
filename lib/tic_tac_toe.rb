require 'pry'

class TicTacToe
	def initialize
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	WIN_COMBINATIONS = [
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,4,8],
	[2,4,6],
	[0,3,6],
	[1,4,7],
	[2,5,8]
	]

	def display_board
	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def input_to_index(user_input)
		user_input.to_i - 1
	end
	
	def move(index, value)
	  @board[index] = value
	end

	# Helper Method
	def position_taken?(index)
	   !(@board[index] == " ")
	end

	#valid_move?
	def valid_move?(index)
		#if move is valid
		if position_taken?(index) == false && index.between?(0,8) == true
			return true
		#if move is invalid
		elsif position_taken?(index) == true
			return false
		elsif index.between?(0, 8) == false 
			return false
		end
	end
 
	#turn_count
	def turn_count
		turns = 0
		@board.each do |turn|
			if turn == "X"
				turns += 1
			elsif turn == "O"
				turns += 1
			end
		end
		return turns
	end
	
	#current_player
	def current_player
		return turn_count.even? == true ? "X" : "O"
	end

	#turn
	def turn
		puts "Please enter 1-9:"
		user_input = gets.chomp
		index = input_to_index(user_input)
		if valid_move?(index) == true && current_player == "X"
				move(index, value = "X")
				puts display_board
		elsif valid_move?(index) == true && current_player == "O"
				move(index, value = "O")
				puts display_board
		elsif valid_move?(index) == false
			puts "Please enter 1-9:"
			input = gets.chomp
		else 
			puts "Please enter 1-9:"
			input = gets.chomp
		end
	end

	#won?
	def won?
	  WIN_COMBINATIONS.detect do |combo|
	    position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
	  end
	end

	#full
	def full?
		@board.all? do |index|
			 index == "X" || index == "O"
			end
	end

	#draw
	def draw?
			if won? 
				return false
			elsif full? == false 
				return false 
			else 
				return true
			end
	end

	#over
	def over?
			if won? || draw? == true
				return true
			else
				return false
			end
	end

	#winner
	def winner
		winning_combo = won?
		 if winning_combo
		    return @board[winning_combo[0]]
		 end
	end
	
	#play
	def play
	    while over? == false
	    	turn
	    end

	    if draw?
	    	puts "Cat's Game!"
	    elsif winner == "X" 
	    	puts "Congratulations X!"
	    elsif winner == "O"
	    	puts "Congratulations O!"
	    end
	end

end