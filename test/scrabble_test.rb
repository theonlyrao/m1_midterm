gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_scores_single_letter
    zero_pointers = ["", nil, 0]
    one_pointers = %w(A E I O U L N R S T)
    two_pointers = %w(D G)
    three_pointers = %w(B C M P)
    four_pointers = %w(F H V W Y)
    five_pointers = ["K"]
    eight_pointers = %W(J X)
    ten_pointers = %W(Q Z)

    zeros = zero_pointers.length - 1
    ones = one_pointers.length - 1
    twos = two_pointers.length - 1
    threes = three_pointers.length - 1
    fours = four_pointers.length - 1
    fives = five_pointers.length - 1
    eights = eight_pointers.length - 1
    tens = ten_pointers.length - 1

    ex_zero = zero_pointers[Random.new.rand(0..zeros)]
    ex_one = one_pointers[Random.new.rand(0..ones)]
    ex_two = two_pointers[Random.new.rand(0..twos)]
    ex_three = three_pointers[Random.new.rand(0..threes)]
    ex_four = four_pointers[Random.new.rand(0..fours)]
    ex_five = five_pointers[Random.new.rand(0..fives)]
    ex_eight = eight_pointers[Random.new.rand(0..eights)]
    ex_ten = ten_pointers[Random.new.rand(0..tens)]

    assert_equal 0, Scrabble.new.score(ex_zero)
    assert_equal 1, Scrabble.new.score(ex_one)
    assert_equal 2, Scrabble.new.score(ex_two)
    assert_equal 3, Scrabble.new.score(ex_three)
    assert_equal 4, Scrabble.new.score(ex_four)
    assert_equal 5, Scrabble.new.score(ex_five)
    assert_equal 8, Scrabble.new.score(ex_eight)
    assert_equal 10, Scrabble.new.score(ex_ten)
    assert_equal "Sorry, that is not a valid word.", Scrabble.new.score(";12s;df")
  end

  def test_it_knows_a_valid_word
    game = Scrabble.new
    valid = "hello"
    invalid = "h3llo"

    assert_equal true, game.is_valid_word?(valid)
    assert_equal false, game.is_valid_word?(invalid)
  end

  def test_it_can_score_hello
    game = Scrabble.new
    word = "hello"

    assert_equal 8, game.score(word)
  end

  def test_it_is_insensitive_to_case
    game = Scrabble.new
    first = "Hello"
    second = "hello"
    third = "helLO"

    assert_equal game.score(first), game.score(second)
    assert_equal game.score(second), game.score(third)
  end
end
