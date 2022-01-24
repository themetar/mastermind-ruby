require_relative '../core/mastermind'

# Automated player
class Computer
  def initialize
    @guesses = []
  end

  def next_guess()
    # guess randomly
    phrase = loop do
      guess = Array.new(Mastermind::PHRASE_SIZE) { 1 + rand(6) }
      break guess unless @guesses.include?(phrase)
    end

    @guesses << phrase # remember so it won't repeat

    sleep 0.75 # dramatic pause

    phrase
  end
end
