# frozen_string_literal: true

# sets the code for the game to start
module CodeSet
  attr_reader :code

  def computer_code
    @code = (rand * 10_000).to_i.to_s until @code.length == 4 && @code.scan(/\D/).empty?
    player_guess # start the game vs computer game_turns
  end

  def player_code
    puts 'Please input a 4 digit numeric code'
    @code = gets.chomp until @code.length == 4 && @code.scan(/\D/).empty?
    computer_guess # start the game vs human
  end
end
