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

  # Converts array of digits to colored string
  def self.colorize_code(code)
    code.collect { |c| DIGIT_MAP[c] || c.to_s }.join
  end  
end
