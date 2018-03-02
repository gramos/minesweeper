Minesweeper
============

Install
========

```bundle install```

Run the server:

```rackup```

API
===

Architecture
-------------

The api basically has 2 actions, one to start a game and get the
board with all the data and the other one to get the adjacents to
be revealed.

Start a game
-------------

```POST /mine_sweeper```

This action will create a new game and return the board as JSON format
like this:

```[[0,0,0,0,2,"x"],[1,1,1,0,2,"x"],[1,"x",2,1,1,1],[1,3,"x",2,0,0],[0,2,"x",2,1,1],[0,1,1,1,1,"x"]]```

this like a matrix where the 'x' means there is a mine in that position and
the number means the number of adjacents mines.

Adjacents to be revealed
-------------------------

```POST /mine_sweeper/:row/:col/:board```

This simulates a click action to get the adjacents squares to be revealed

Tests
=====

cutest test/*_test.rb



