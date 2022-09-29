CHARS = %w( 0 1 2 3 4 5 6 7 8 9 a b c d e f )

def generate_uuid

  uuid = ''
  sections = [8,4,4,4,12]

  sections.each_with_index do |section, idx|
    section.times { uuid << CHARS.sample }
    uuid << '-' if idx < (sections.size - 1) 
  end
  uuid

end

p generate_uuid
