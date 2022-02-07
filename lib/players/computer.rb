require_relative '../core/mastermind'

# Automated player
class Computer
  def initialize
    @guesses = []
  end

  def next_guess
    # guess randomly
    code = loop do
      guess = rand(6 ** Mastermind::PHRASE_SIZE)
      break guess unless @guesses.include?(guess)
    end

    @guesses << code # remember so it won't repeat

    sleep 0.75 # dramatic pause

    convert(code)
  end

  private

  def convert(int_code)
    out = []
    until out.length == Mastermind::PHRASE_SIZE
      digit = int_code % 6
      out.unshift(digit + 1)
      int_code = (int_code - digit) / 6
    end
    out
  end
end
