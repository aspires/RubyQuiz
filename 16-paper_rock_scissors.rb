#unfinished

hand = %w[Rock Paper Scissors]

hand.shuffle!

compy = hand.first

puts "Lets play paper, rock, scissors"
puts "Choose paper, rock or scissors"

input_player = gets.strip.downcase
player = input_player[0]

puts player

def game_guts(player, computer)
  puts computer
  comp_short = computer[0].downcase
  
  case player
    when "p"
      case comp_short
      when "r"
        puts "You Win"
      when "s"
        puts "You Lose"
      when "p"
        puts "TieFail"
      end
      
    when "r"
        case comp_short
        when "s"
          puts "You Win"
        when "p"
          puts "You Lose"
        when "r"
          puts "TieFail"
        end
        
    when "s"
      case comp_short
      when "p"
        puts "You Win"
      when "r"
        puts "You Lose"
      when "s"
        puts "TieFail"
      end
  end
  
end

game_guts(player, compy)