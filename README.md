# Intro Game Programming
_Derived from a course taught in Spring 2020_

_Instructor: Hyacinth Nil Ramsay_

This course is taught in 2 parts: beginning with an introduction to game programming concepts in 2D using the very fun framework [LöVE 2D](love2d.org) and then moving to 3D game development in [Unity](unity.com). This document will be updated as I (the instructor) have time and energy.

_If you're not in my class but are reading this and are interested in anything specific, feel free to email me at [hyacinth@hyacinthnil.com](mailto:hyacinth@hyacinthnil.com)_

___

## Part 0: Basic LöVE and Lua concepts
### Setting Up
love 2d (stylized LöVE, but from here on out I'll write "love" or "love 2d") is a pretty friendly framework for making games with. It uses the also pretty friendly scripting language Lua to write the logic for your games. All love games have one main script called __main.lua__--without this file, they will not function. To make a love game, download the engine from [love2d.org](love2d.org), make a new folder and create a __main.lua__ file in it. Once you're ready to build it, drag the whole folder onto your __love.exe__ file on your computer or use the [love-ide](https://atom.io/packages/love-ide) package for the [Atom text editor](atom.io).

_note: the love-ide package doesn't like nested folder structures, so if you have your folder with main.lua in it inside another folder, add the main game folder as a project folder in atom without the wrapper folder_

### Variables in Lua
Like most programming languages, Lua allows you to write variables. A variable is basically a name that we give to a piece of data.

Consider a game that has health. We probably want to have a way to check our character's health consistently in our code. Small problems like this are when variables are most useful--whenever we have information that could change during the course of play, we'll want to use them.

If we wanted to write a health variable in lua, we'd simply write ```health = 100``` where `100` is the initial health value.

I like to think of variables as the nouns of our code. They're often the stuff that the other pieces of our game use and act on.

_note: like a lot of parts in programming, variables do not mean anything until they're put in context. This health variable doesn't actually represent health yet--it is only the number 100. Eventually we'll make it mean something but right now it's just a name that makes its use easier to envision_

#### Types of Variables
Lua is dynamically typed, which means we don't need to worry about the sort of data we're giving a variable before we give it. For instance, if we write

```
health = 100
friend = "dog"
health = friend
```

that's allowed, and means that our program understands the variable `health` to mean the word `"dog"` until we set it to something else. To reiterate, a variable is just a name for some data; what we do with it is what makes it matter.

There are a few types of variables we're concerned with in Lua:
*   numbers
*   strings
*   booleans
*   tables

__Numbers__ are pretty self explanatory, but it's worth noting that Lua basically deals with whole and decimal numbers in the same way as far as we're concerned.

__Strings__ are words, letters, punctuation, and any grouping of written characters. `"dog"` in our earlier example is a string. While also fairly self explanatory, we can write something like
```
ten = 10
tenTwo = "10"
```
where `ten` is a number and `tenTwo` is a string. Anything wrapped in quotes is a string, so bear that in mind.

__Booleans__ are variables that can only be in one of two states, either `true` or `false`. Think of a toggleable light switch--if it's off, and we flip it on, it's no longer off. Booleans work the same way, and are useful for toggling different binary states in game. We could revise an earlier example to look like

```
health = 100
isDead = false
if health <= 0 then
  isDead = true
end
```
Here, we're controlling our hypothetical player's death state with a variable called `isDead`.

__Tables__ are a really cool feature of Lua, and they're unique to the language as far as I know. Other languages have similar stuff but none that is as clean and pleasant to use as a Lua table.

Tables function as collections of different information. We'll be using them a lot so you don't have to internalize all of their workings right now, but the important part is that whenever you have a bunch of related functionality, you'll probably want to put it in a table. A common use, we'll see, is for bundling up all of the functionality of a `player`. Let's make a player table for the previous example:
```
player = {}
player.health = 100
player.isDead = false
if player.health <= 0 then
  player.isDead = true
end
```
As we see, we define an empty table by writing `tableName = {}`, then we can add different parameters to it by writing `tableName.tableParameter = parameterValue`. This can get complicated, but these basics should be enough for our first few projects.

#### Takeaways
*   Whenever you want to reference something that will change at some point, you'll probably want to use a variable
*   Lua doesn't care what kind of information you give a variable, so long as it's syntactically appropriate
*   Bundling a bunch of information together into one idea is a good use case for using a table
### Control Statements
We'll be getting deeper into control flow later, but up front there's only one sort of control statement to keep in mind; the `if` statement. `if` statements in lua are extremely readable, especially compared to many programming languages. Let's use the variable we made in the last section in this example:

```
if health == 100 then
  print("health is full")
end
```

Here, we're checking _if_ our health variable is 100, and printing a message to the console if it is. You can probably see its use at this point. For instance, I bet you can see the utility of a statement like

```
if health == 0 then
  print("you're dead")
end
```

`if` statements need 3 key words. `if` starts the statement. Immediately following the `if`, the statement requires something to check for, usually some kind of equivalence or comparison. This is followed by the word `then`.

All `if` statements conclude with the word `end`.

`if` statements can branch as well. What if, for instance, you wanted something to happen when your health is less than `100` but greater than `50`. We could write something like this:
```
if health == 100 then
  print("health is full")
elseif health < 100 and health > 50 then
  print("you're hurt")
elseif health <= 0 then
  print("you're dead")
end
```

This adds a few more wrinkles, such as the `and` keyword and the `>` and `<` operators. We'll come back to this, but for now, understand that an `elseif` can follow an `if` if you want to check for additional conditions in the same statement. You can also use the `else` keyword as a catch-all term for all other conditions. For example:

```
if health == 100 then
  print("you're not hurt")
else
  print("you're hurt")
end
```

Here, we have only 2 possible conditions we're checking for so we check for the one that has a definite point at which it's true (100 health means you're not hurt), and anything that falls outside of that we catch with the `else` statement.

### Functions
If we think of variables as our nouns, then functions are more like our verbs. They are what allow us to do stuff in our code.

<!--TODO add this section-->

### love-Specific Functions
A love game has 3 main callback functions that your game will use.
*   `love.load()` is responsible for all setup actions and runs once at the moment your game starts
*   `love.update()` is run every frame. This is where changes to the state of the game and the core logic of the game happens
*   `love.draw()` also runs every frame and is where any graphical changes happen
