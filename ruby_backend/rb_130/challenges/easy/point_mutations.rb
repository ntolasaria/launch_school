# Reqiured class - DNA

# - initialize with 1 argument
# - instance variable strand

# Methods required:
# - hamming_distance
# - argument 1 - string - strand
# - no of diffferences between two strands
# - in case of unequal lengths, compute over the shorter length


class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    shorter = @strand.size < other_strand.size ? @strand : other_strand
    distance = 0

    shorter.size.times do |index|
      distance += 1 unless @strand[index] == other_strand[index]
    end

    distance
  end
end