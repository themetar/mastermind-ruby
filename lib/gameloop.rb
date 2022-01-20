require_relative 'core/mastermind'

class Gameloop
  def initialize(mastermind, player)
    @mastermind = mastermind
    @player = player
  end

  # loops until the player has guessed correctly, or spent the number of tries.
  # on each iteration it gets a guess from the player and passesit to mastermind board.
  # the feedback result is displayed and checked to see if the game has ended by winning.
  def run
    turn = 1
    while @mastermind.tries > 0
      puts
      puts "Turn ##{turn}, #{@mastermind.tries} tries left"
      player_guess = @player.next_guess
      feedback = @mastermind.guess(player_guess)
      puts player_guess.join(' '), feedback.join(', ')

      turn += 1

      if feedback.length == Mastermind::PHRASE_SIZE && feedback.all?(:correct)
        puts 'Player won'
        puts "correct code", @mastermind.secret
        break
      end

      if @mastermind.tries.zero?
        puts "Player lost"
        puts "correct code", @mastermind.secret
      end
    end
  end
end
