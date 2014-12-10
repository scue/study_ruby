#!/usr/bin/env ruby
# encoding: UTF-8

# 每个元素皆对象
# times, upto 称为迭代器(iterator)
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

# Hash, 哈希
hash_tab = {
    :one   => 1,
    :two   => 2,
    :three => 3
}

# #{} 内部可以是任何类型的对象，自动调用to_s
hash_tab.each do |key,value|
    puts "hash_tab, #{value}:#{key}"
end

# 表达式和操作符
# Ruby操作符都是使用方法来实现的
# 除了'='不能重写以外，其他都可以
# 此外，Ruby没有 ++ 和 -- 操作符
# 其中，[] 重写最为广泛操作符之一
1 + 2               # 相加
1 * 2               # 相乘
1 + 2 == 3          # 判断是否相等
2 ** 1024           # 幂乘
"Ruby" +  " rocks!" # "Ruby rocks!"
"Ruby! " * 3        # "Ruby! Ruby! Ruby!"

# 方法 - 全局函数
# squrae x 和 square(x) 两者无区别
def square x
    x*x             # x*x作为返回结果
end

# 方法 - 单键(singleton)
# Ruby的类和模块都是开放的
# 运行过程中，可能随时给类和模块添加方法
# 此类方法，统一称为单键singleton
def Math.square(x)
    x*x
end

# 方法 - 返回多值
def polar(x, y)
    thera = Math.atan2(y, x)
    r = Math.hypot(x,y)
    [r, thera]
end
distance, angle = polar(2, 2)

# 方法 - 带 = 号
# 假定: 对象o有方法x=
# 那么:
#   o.x=(1)
#   o.x = 1
# 两者效果相同

# 方法 - 后缀
# ? 表示返回值是boolean型
# ! 表示强制修改当前操作的对象，不带!则是copy一份出来操作
#

# 变量 - 前缀
# $     全局变量
# @     实例变量
# @@    类变量

# 赋值
x = 1
y = 2
x += 1
y -= 1            # = 操作符可以与其他符号组合
x,y = 1,2         # 多个赋值
a,b = b,a         # 交换两者值
x,y,z = [1, 2, 3] # 数组自动拆分并赋值

# Regexp 和 Range
# 正则表达式和范围
# 方法: ==
/[Rr]uby/ # 匹配 Ruby 或 ruby
/\d{5}/   # 匹配五位数
1..3      # 1<= x <=3
1...3     # 1<= x <3
# 方法: === (membership, 条件相等性操作符)
birthyear = 1991
generation = case birthyear
    when 1946..1963; "Baby Boomer"
    when 1964..1976; "Generation X"
    when 1978..2000; "Generation Y"
    else nil
end
puts generation
