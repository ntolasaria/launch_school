# p [1, 2, 3, 4, 5].map(& :to_s)

def my_method
  yield(2)
end

p a_proc = :to_s.to_proc
p my_method(& a_proc)