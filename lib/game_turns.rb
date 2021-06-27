module GameTurns
  attr_accessor :turn

  def player_guess
    until @turn >= 12
      puts "turn number #{turn}"
      if code_check(gets.chomp, @code) == 'Win' # code_check
        puts 'You got the right code! You won!'
        break
      end
      @turn += 1
    end
    puts "You lost! The code was #{@code}!" if turn >= 12
  end

  def computer_guess
    first_turn
    until @turn <1 && @turn >= 12
      puts "turn number #{@turn}"
      if code_check(computer_think, @code) == 'Win' # code_check, computer_think
        puts 'The computer got the right code!'
        break
      end
      @turn += 1
    end
    puts "Computer couldn't guess #{@code}!" if turn >= 12
  end
end
