# frozen_string_literal: true

require 'unicode/display_width'

['Hello world', 'こんにちはせかい', 'Hこeんlにlちoは wせoかrいld', 'H😄i😅,😓b😢o😱y'].each do |m|
  puts "#{m}(#{Unicode::DisplayWidth.of(m, 1, {}, emoji: true)})"
end
