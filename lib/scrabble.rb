require 'pry'

class Scrabble

  def score(word)
    if is_valid_word?(word)
      sum_point_values(word)
    elsif (word == 0) | (word.nil?)
      0
    else
      "Sorry, that is not a valid word."
    end
  end

  def is_valid_word?(word)
    if is_not_string(word)
      false
    elsif all_chars_valid?(word)
      true
    else
      false
    end
  end

  def is_not_string(word)
    word.class != String
  end

  def all_chars_valid?(word)
    word.upcase.chars.map do |char|
      point_values.keys.include?(char)
    end.all? { |char| char == true }
  end

  def sum_point_values(word)
    if word == ""
      0
    else
      word.upcase.chars.map do |char|
        point_values[char]
      end.reduce(:+)
    end
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
