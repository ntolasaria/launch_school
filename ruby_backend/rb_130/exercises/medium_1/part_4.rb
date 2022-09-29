def types(birds)
  yield(birds) if block_given?
end

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

types(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(", ")}" }