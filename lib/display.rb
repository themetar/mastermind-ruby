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

  # Converts array of digits to colored string
  def self.colorize_code(code)
    code.collect { |c| DIGIT_MAP[c] || c.to_s }.join
  end

  # Converts array of feedback symbols to string of dots
  def self.colorize_feedback(feedback)
    feedback.collect { |f| FEEDBACK_MAP[f] || f.to_s }.join
  end
end
