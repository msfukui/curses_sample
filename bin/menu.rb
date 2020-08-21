# frozen_string_literal: true

require 'curses'

WAVFILES = [
  ['Theme A', 'music/xetris_theme_a.wav'],
  ['Theme B', 'music/xetris_theme_b.wav']
].freeze

Curses.init_screen
Curses.noecho
Curses.stdscr.keypad(true)

Curses.setpos(10, 10)

menu = Curses::Menu.new(WAVFILES)

menu.post

while ch = Curses.getch
  begin
    case ch
    when Curses::KEY_UP, ?k
      menu.up_item
      c = menu.current_item
      Curses.setpos(15, 10)
      Curses.addstr(c.name)
      Curses.setpos(16, 10)
      Curses.addstr(c.description)
#      system("afplay #{c.description}")
    when Curses::KEY_DOWN, ?j
      menu.down_item
      c = menu.current_item
      Curses.setpos(15, 10)
      Curses.addstr(c.name)
      Curses.setpos(16, 10)
      Curses.addstr(c.description)
#      system("afplay #{c.description}")
    else
      break
    end
  rescue Curses::RequestDeniedError
  end
end

menu.unpost

Curses.close_screen
