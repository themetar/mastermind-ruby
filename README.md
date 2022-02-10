# Mastermind

*Command-line Mastermind game*

[![Run on Repl.it](https://repl.it/badge/github/themetar/mastermind-ruby)](https://replit.com/@themetar/mastermind-ruby)

## About game

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) is a code breaking game. The objective is to break (guess) a secret code comprised of 4 color-coded digits from 1 to 6.

One player, the code maker, thinks of code, and the code breaker needs to guess that secret code in 12 tries. On each guess, the code maker gives hints on how good the guess was, with black and red pegs: A black peg is awarded for each guessed digit that is in its correct place. Red pegs are given for digits that are present somewhere in the secret code.

## Run 

Prerequisites: [Ruby](https://www.ruby-lang.org/en/), [Bundler](https://bundler.io/)

1. Get the code
2. run `bundle install` inside project directory
3. run `ruby lib/main.rb` to start the game
