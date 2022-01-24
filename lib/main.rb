require 'bundler/setup'

# require 'tty-prompt'
require 'pastel'
require_relative 'core/mastermind'
require_relative 'players/human'
require_relative 'players/computer'
require_relative 'gameloop'

# prompt = TTY::Prompt.new
pastel = Pastel.new

# ans = prompt.ask(pastel.black.on_white('Hello?'))

# puts ans

puts pastel.black.on_red('Mastermind')

Gameloop.new(Mastermind.new, Computer.new).run
