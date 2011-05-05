$: << File.expand_path("../..", __FILE__)
require "spec_helper"

module Mastermind
  describe Game do
      before(:each) do
        @messenger = mock("messenger").as_null_object
        @game=Game.new(@messenger)
      end
      
    context "Staring up" do
      it "should send a welcome message" do
        @messenger.should_receive(:puts).with("Welcome to Mastermind!" )
        @game.start(%w[r g y c])
      end
      it "should prompt for the first guesss" do
        @messenger.should_receive(:puts).with("Enter guess:")
        @game.start(%w[r g y c])
      end
    end
    
    context "Marking a guess" do
      context  "With all 4 colors correct with all pegs in correct position" do
        it "should mark the guess with bbbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbbb")
          @game.guess(%w[r g y c])
        end
      end
      
      context  "With all 4 colors correct with 2 pegs in correct position" do
        it "should mark the guess with bbww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbww")
          @game.guess(%w[r g c y])
        end
      end
      
      context "With all 4 colors correct with 1 peg in the correct position" do
        it "should mark the guess with bwww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bwww")
          @game.guess(%w[r c g y])
        end
      end
      
      context "With 3 colors correct and in the correct position with 1 wrong guess" do
        it "should mark the guess with bbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbb")
          @game.guess(%w[w g y c])
        end
      end
      
      context "With 3 colors correct and 2 in correct position with 1 wrong guess" do
        it "should mark the guess with bbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbw")
          @game.guess(%w[w r y c])
        end
      end
           
    end # end context "Marking a guess"
    
    context "With duplicates in the guess that match a peg in the code " do
      context "by color and position" do
        it "should add a single b to the mark" do
          pending()
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbb")
          @game.guess(%w[r g y y])
        end
      end
    end
  end # end describe Game
end # end module