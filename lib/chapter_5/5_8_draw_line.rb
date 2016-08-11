# 5.8 Draw Line
# A monochrome screen is stored as a single array of bytes, allowing eight
#   consecutive pixels to be stored in one byte. The screen has width w, where
#   w is divisible by 8 (that is, no byte will be split across rows). The height
#   of the screen, of course, can be derived from the length of the array and
#   the width. Implement a function that draws a horizontal line from (x1, y) to
#   (x2, y).
#
def draw_line(screen, width, x1, x2, y)
  screen = clear_screen(screen)
  elements_per_row = width / 8
  row_offset = elements_per_row * y

  # Find the elements we need to manipulate
  start_index = row_offset + (x1 / 8)
  end_index = row_offset + (x2 / 8)

  (start_index..end_index).each do |index|
    # Set entire element
    screen[index] = [255]

    # Clear leading pixels
    screen[index][0] &= (1 << (8 - x1 % 8)) - 1 if index == start_index

    # Clear ending pixels
    screen[index][0] &= (-1 << (8 - (x2 % 8) - 1)) if index == end_index
  end
  screen
end

# Sets all pixels to black
def clear_screen(screen)
  screen = screen.map{ [0] }
end
