require 'pastel'

# Methods related to making the UI pretty
module Display
  pastel = Pastel.new

  DIGIT_MAP = {
    1 => pastel.black.on_red(" 1 "),
    2 => pastel.black.on_green(" 2 "),
    3 => pastel.black.on_yellow(" 3 "),
    4 => pastel.black.on_blue(" 4 "),
    5 => pastel.black.on_magenta(" 5 "),
    6 => pastel.black.on_cyan(" 6 ")
  }

  FEEDBACK_MAP = {
    :correct => pastel.black.on_white(" • "),
    :partial => pastel.red.on_white(" • ")
  }

  @@help_text = %Q{Welcome! #{pastel.bold('Mastermind')} is a game where the objective is to break (guess) a
secret code. The code is comprised of #{Mastermind::PHRASE_SIZE} color-coded digits from 1 to 6.

                #{Display::DIGIT_MAP.values.join(' ')}

The code maker thinks of code, and the code breaker needs to guess that
secret code in 12 tries. On each guess, the code maker gives hints on how
good the guess was, with black and red pegs. #{Display::FEEDBACK_MAP.values.join(' ')}

A black peg is awarded for each guessed digit that is in its correct place.
Red pegs are given for digits that are present somewhere in the secret code.   
}

  def self.print_help
    puts @@help_text
  end

  # Converts array of digits to colored string
  def self.colorize_code(code)
    code.collect { |c| DIGIT_MAP[c] || c.to_s }.join
  end

  # Converts array of feedback symbols to string of dots
  def self.colorize_feedback(feedback)
    feedback.collect { |f| FEEDBACK_MAP[f] || f.to_s }.join
  end
end
