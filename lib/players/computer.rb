require_relative '../core/mastermind'

# Automated player
class Computer
  def self.convert(int_code)
    out = []
    until out.length == Mastermind::PHRASE_SIZE
      digit = int_code % 6
      out.unshift(digit + 1)
      int_code = (int_code - digit) / 6
    end
    out
  end

  ALL_CODES = (0...6**Mastermind::PHRASE_SIZE).collect { |i| convert(i) }
  
  def initialize
    @remaining_codes = ALL_CODES
  end

  def next_guess(feedback)
    # first guess
    if feedback.nil?
      # guess randomly
      guess = self.class.convert(rand(6 ** Mastermind::PHRASE_SIZE))
    else
      # every other
      @remaining_codes = @remaining_codes.select { |c| Mastermind.compare(@last_guess, c) == feedback }

      guess = @remaining_codes[rand(@remaining_codes.length)]
    end
    @last_guess = guess
    
    sleep 0.75 # dramatic pause
    
    guess
  end  
end
