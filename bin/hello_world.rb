# frozen_string_literal: true

require 'curses'

Curses.init_screen
Curses.setpos(4, 10)          # Move cursor
Curses.addstr('Hello, world') # print string
Curses.setpos(5, 10)
Curses.addstr('Press any key: ')
Curses.get_char               # Read a character
Curses.close_screen
