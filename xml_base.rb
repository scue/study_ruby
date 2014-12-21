#!/usr/bin/env ruby
# encoding: UTF-8
# 参考: http://blog.csdn.net/shandong_chu/article/details/5811074

require 'rexml/document'

xmlfile="text.xml"

# 生成XML
file = File.new(xmlfile, "w+")
doc = REXML::Document.new()
element=doc.add_element("book", {'name'=>'Programming Ruby', 'author'=>'Joe Chu'})
chapter1 = element.add_element('chapter1','title'=>'chapter 1')
chapter2 = element.add_element('chapter2','title'=>'chapter 2')
chapter1.add_text("chapter 1 content")
chapter2.add_text("chapter 2 content")
file.write(doc)
file.close()
open('text.xml', 'r') { |io| 
    puts io.readlines
}

# 解析XML
doc2 = REXML::Document.new(File.read(xmlfile))
puts "doc2:", doc2                                                     # 输出所有内容
puts "doc2.root.name:", doc2.root.name                                 # 输出根信息
puts "doc2.root.attributes['name']:", doc2.root.attributes['name']     # 输出根节点name=的属性值
puts "doc2.root.attributes['author']:", doc2.root.attributes['author'] # 输出根节点author=的属性值
chapter1_2 = doc2.root.elements[1]                                     # Root节点的第一个节点
chapter2_2 = doc2.root.elements[2]                                     # Root节点的第二个节点
puts "chapter1_2.attributes['title']:", chapter1_2.attributes['title'] # 第一个节点的title属性值
puts "chapter1_2.text:", chapter1_2.text                               # 第一个节点包含的文字

# 删除文件
# File.delete(xmlfile)
