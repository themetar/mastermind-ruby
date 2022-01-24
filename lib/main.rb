require 'bundler/setup'

require 'tty-prompt'
require 'pastel'
require_relative 'core/mastermind'
require_relative 'players/human'
require_relative 'players/computer'
require_relative 'gameloop'

prompt = TTY::Prompt.new
pastel = Pastel.new

loop do
  puts
  puts "Let's play #{pastel.bold('Mastermind')}!"
  puts

  choice = prompt.enum_select('What would you like to do?') do |menu|
    menu.choice 'Break a code generated by the computer', :break
    menu.choice 'Make a code and let the computer try and guess it', :make
    menu.choice 'Exit game', :exit
  end

  case choice
  when :break
    player = Human.new
  when :make
    player = Computer.new
    secret = Human.new.next_guess # a bit of a hack
  when :exit
    sure = prompt.yes?('Are you sure you want to exit?', default: false)
    exit if sure
    next # go to begining of loop if not sure
  end

  # run a game 
  Gameloop.new(Mastermind.new(secret), player).run
end
