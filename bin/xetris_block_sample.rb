# frozen_string_literal: true

require 'curses'

#
# テトリミノの定義
#

# ブロックの表示文字
block = '*'
non_block = ' '

# テトリミノの種類の定義
mino = {
  T: [
    [0, 1, 0],
    [1, 1, 1]
  ],
  S: [
    [0, 1, 1],
    [1, 1, 0]
  ],
  Z: [
    [1, 1, 0],
    [0, 1, 1]
  ],
  Line: [
    [1, 1, 1, 1]
  ],
  Square: [
    [1, 1],
    [1, 1]
  ],
  J: [
    [1, 0, 0],
    [1, 1, 1]
  ],
  L: [
    [0, 0, 1],
    [1, 1, 1]
  ]
}

#
# ゲーム盤の定義
#

# ケーム盤の表示の開始位置
top = 10
left = 10

# Window 内の表示余白
height_padding = 2
width_padding = 2

# ウィンドウのタイトル表示
title = '<Xetris mod>'

height = 26 + (height_padding * 2)
width = 10 + (height_padding * 2)

# タイトルのセンタリングのため、必要に応じて全体の幅サイズを補正する
width % 2 != title.size % 2 && width += 1

Curses.init_screen
win = Curses::Window.new(height, width, top, left)
win.box('|', '-')

# タイトルはセンタリングしてウィンドウに重ねて表示する
win.setpos(0, (width - title.size) / 2)
win.addstr(title)

# ブロックを padding サイズ分余白を入れて左詰めで一行ごとに表示する
i = 0
mino.each do |k, v|
  win.setpos(i + height_padding, width_padding)
  win.addstr "#{k}:"
  i += 1
  win.setpos(i + height_padding, width_padding)
  v.each do |s|
    s.each do |b|
      if b == 1
        win.addstr(block)
      else
        win.addstr(non_block)
      end
    end
    i += 1
    win.setpos(i + height_padding, width_padding)
  end
  i += 1
end

win.refresh
win.get_char
Curses.close_screen
