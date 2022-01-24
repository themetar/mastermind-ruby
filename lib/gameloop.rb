require_relative 'core/mastermind'
require_relative 'display'

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

      puts
      player_guess = @player.next_guess
      feedback = @mastermind.guess(player_guess)

      puts "#{Display.colorize_code(player_guess)}\t#{Display.colorize_feedback(feedback)}"

      turn += 1

      if feedback.length == Mastermind::PHRASE_SIZE && feedback.all?(:correct)
        puts
        puts 'Player won!'
        puts "#{Display.colorize_code(@mastermind.secret)} was the secret code!"
        break
      end

      if @mastermind.tries.zero?
        puts
        puts "Player lost"
        puts "The secret code was #{Display.colorize_code(@mastermind.secret)}"
      end
    end
  end
end
