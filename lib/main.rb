require 'bundler/setup'

require 'tty-prompt'
require 'pastel'

prompt = TTY::Prompt.new
pastel = Pastel.new

ans = prompt.ask(pastel.black.on_white('Hello?'))

puts ans
