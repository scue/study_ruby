#!/usr/bin/env ruby
# encoding: UTF-8

# 每个元素皆对象
3.times { |n| puts "Ruby! %d" % n  }
1.upto(9) { |n| puts "x %d" % n }
puts

a = [3, 2, 1]
a[3] = a[2] - 1

# 格式化输出
a.each do |element|
    puts "element a: %d" % [element]
end

# 组建新数组
b=a.map do |x|
    x*x
end

c=a.select do |x|
    x%2 == 0
end

puts
b.each do |element|
    puts "element b: %d " % element
end

puts
c.each do |element|
    puts "element c: %d " % element
end

hash_tab = {
    :one => 1,
    :two => 2,
    :three => 3
}

# #{} 内部可以是任何类型的对象，自动调用to_s
hash_tab.each do |key,value|
    puts "hash_tab, #{value}:#{key}"
end
