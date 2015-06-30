require 'memory_profiler'

require_relative "../../lib/picky"

# result = MemoryProfiler.report do
#
# end
#
# result.pretty_print

require 'objspace'

ary = []

(1..1000).each do |i|
  ary << i
end

p ObjectSpace.memsize_of(ary)
p [ary.size, (ObjectSpace.memsize_of(ary)-40) / 8]

500.times { ary.pop }

p ObjectSpace.memsize_of(ary)

ary2 = Array[*ary]
p [ary2.size, (ObjectSpace.memsize_of(ary2)-40) / 8]

p ObjectSpace.memsize_of(ary2)

ary.clear

p ObjectSpace.memsize_of(ary)