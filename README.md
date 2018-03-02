Minesweeper
============

Live example
=============

[Play now!](http://minesweeper.lacasa.tech/play/)

Install
========

```bundle install```

Run the server:

```rackup```

Tools
======

API:
----

ruby + cuba + cutest

FrontEnd:
---------

HTML + Javascript

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

```curl -X POST http://minesweeper.lacasa.tech/mine_sweeper```

Adjacents to be revealed
-------------------------

```POST /mine_sweeper/:row/:col/:board```

This simulates a click action to get the adjacents squares to be revealed

Run tests
=========

cutest test/*_test.rb

TODO
====

* Change board param in /mine_sweeper/:row/:col/:board, is not a good idea
  sending the board in the URL.

* Adjacents is not fully working.

* Set headers "Accept: application/json"

* Move API url to a YAML or something like that in the javascript code.

* Set http response status.

* Add http test for API.
