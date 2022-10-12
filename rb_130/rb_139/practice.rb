def proc_method
  Proc.new { |n| n ** 2}
end

def method_a(proc)
  p proc.call(5)
end

def method_b(&block)
  p block.call(6)
  p yield(9)
end

method_a(proc_method)
# p method_b(&proc_method)
method_b(&proc_method)