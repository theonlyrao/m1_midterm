BDD - Why we're here
--------------------

I'm preparing for the module 1 mid-module assessment. This preparation involves creating the basic scoring functionality for a game that presumably resembles Scrabble.

I am being scored on a variety of abilities, including
  1) my ability to use the best tools that Ruby has to offer
  2) write solutions that are clear and concise
  3) choose the best enumerator methods and blocks to accomplish particular tasks
  4) using small testing steps for design and verification
  5) working efficiently
  6) actively seeking collaboration during all phases of the development process

In the preparation phase, I will be attempting to show the abilities listed in categories 1), 2), 3) and 4).

BDD - Process
-------------

$ game = Scrabble.new
=> ...
$ game.score("hello")
=> 8
$ game.score("")
=> 0
$ game.score(nil)
=> 0
$ game.score(0)
=> 0
