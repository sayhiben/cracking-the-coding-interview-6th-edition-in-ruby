# 8.10 Paint Fill
# Implement the "paint fill" function that one might see on many image editing
#   programs. That is, given a screen represented by a two-dimensional array of
#   colors, a point, and a new color, fill in the surounding area until the
#   color changes from the original color.
#
def paint_fill(screen, point, new_color, old_color = nil)
  x = point[0]
  y = point[1]

  old_color ||= screen[y][x]
  if screen[y][x] != old_color
    return
  else
    screen[y][x] = new_color
    paint_fill(screen, [x, y + 1], new_color, old_color) if y + 1 < screen.length
    paint_fill(screen, [x, y - 1], new_color, old_color) if y - 1 >= 0
    paint_fill(screen, [x + 1, y], new_color, old_color) if x + 1 < screen[0].length
    paint_fill(screen, [x - 1, y], new_color, old_color) if x - 1 >= 0
  end
  screen
end
