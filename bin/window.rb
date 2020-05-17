# frozen_string_literal: true

#
# Terminal Window の表示サンプル
#
require 'curses'

# 表示の開始位置
top = 10
left = 10

# Window 内の表示余白
height_padding = 2
width_padding = 2

title = '<Window Sample>'
message = %w[Hello World Goodby Mylife SampleExampleStringValue]

height = message.size + height_padding * 2
width = (message + [title]).map(&:size).max + width_padding * 2

# タイトルのセンタリングのため、必要に応じて全体の幅サイズを補正する
width % 2 != title.size % 2 && width += 1

Curses.init_screen
win = Curses::Window.new(height, width, top, left)
win.box('|', '-')

# タイトルはセンタリングしてウィンドウに重ねて表示する
win.setpos(0, (width - title.size) / 2)
win.addstr(title)

# メッセージは padding サイズ分余白を入れて左詰めで一行ごとに表示する
message.each_with_index do |m, i|
  win.setpos(i + height_padding, width_padding)
  win.addstr(m)
end

win.refresh
win.get_char
Curses.close_screen
