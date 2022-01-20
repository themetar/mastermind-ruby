require 'tty-prompt'
require_relative '../core/mastermind'

class Human
  # Returns the player's guess in the form of an integer array
  def next_guess
    prompt = TTY::Prompt.new

    # prompt the user for a guess
    guess = prompt.ask("Input code:") do |ans|
              ans.validate Regexp.new "^[1-6]{#{Mastermind::PHRASE_SIZE}}$"
              ans.messages[:valid?] = "Your guess must consist of #{Mastermind::PHRASE_SIZE} digits, from 1 to 6"
            end

    # convert the input string to an array of digits 
    guess.split('').map(&:to_i)
  end
end
