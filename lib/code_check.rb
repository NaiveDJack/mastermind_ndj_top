# check in wrong place + in right place according to rules
module CodeCheck
  attr_reader :total_included, :correct_places, :wrong_places, :output
  
  def code_check(guess, code)
    code_feedback(guess, code)
    'Win' if @correct_places == 4
  end

  def code_feedback(guess, code)
    @total_included = code_inclusion(guess, code)
    @correct_places = code.chars.select.with_index { |digit, index| digit == guess[index] }.count
    @wrong_places = @total_included - @correct_places
    @output = [correct_places, wrong_places]
    p @output
    puts "Got #{@correct_places} in the right place and #{@wrong_places} right but in the wrong place"
  end

  def code_inclusion(guess, code)
    code_tally = code.chars.tally
    guess_right = guess.chars.tally.select { |digit| code_tally.include? digit }

    guess_right.each_key do |key|
      guess_right[key] = code_tally[key] if guess_right[key] > code_tally[key]
    end
    guess_right.values.sum
  end
end