birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

def types(array)
  yield(array)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
