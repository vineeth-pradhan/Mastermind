$: << File.expand_path( "../../lib" , __FILE__)
require 'mastermind'

game = Mastermind::Game.new(STDOUT)
game.start(%w[r g y c])

while guess = gets
  game.guess guess.split
end