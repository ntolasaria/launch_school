def print_line(n, offset)
  diamond_count = n - (offset * 2)
  puts ('*' * diamond_count).center(n)
end

def diamond(n)
  center_idx = n / 2

  n.times do |idx|
    center_offset = (center_idx - idx).abs
    print_line(n, center_offset)
  end
end

# Further Exploration

def print_diamond_outline(n, offset)
  spaces = n - 2 - (offset * 2)
  if spaces < 0
    puts '*'.center(n)
  else
    puts ('*' + ' ' * spaces + '*').center(n)
  end
end


def diamond_outline(n)
  center_idx = n / 2
  n.times do |idx|
    center_offset = (center_idx - idx).abs
    print_diamond_outline(n, center_offset)
  end
end


diamond(5)
diamond_outline(5)