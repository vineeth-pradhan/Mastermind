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
       result = ""
       temp = [nil, nil, nil, nil]
       gcode.each_with_index do |peg, index|
         if @code[index] == peg
           result.insert(0,"b")
           temp[index] = peg
#         elsif @code.include?(peg)
#           result << "w"
#         end
          elsif @code.include(peg) && !temp.include?(peg)
            result << "w"
          end
       end
     @messenger.puts result
    end
  end
end