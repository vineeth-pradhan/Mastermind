module Mastermind
  class Game
    
    def initialize(messenger)      
      @messenger = messenger
    end
    
    def start(code)
      @code = code
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
    
    def guess(gcode)
       result = []
       temp = [nil, nil, nil, nil]
       gcode.each_with_index do |peg, index|
         if @code[index] == peg
           if temp[index] == "w"
             temp[index] == "b"
             result.insert(0,"b")
           else
             result.insert(0,"b")
             temp[index] = "b"
           end
         elsif @code.include?(peg)
         ind = @code.index(peg)
           if temp[ind] == nil
             result << "w"
             temp[ind] = "w"
           else
             next
           end
        end
      end
     @messenger.puts result.join
    end
   
   
  end
end