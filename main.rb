# frozen_string_literal: true

# def  rule_4(i,index,limit)
#     pos=@start_position[index]
#     neigbous=0
#     neigbous+=1 if (i-1) >= 0 && pos[i-1].eql?('*')
#     neigbous+=1 if (i+1) <= limit && pos[i+1].eql?('*')
#     if (index-1) >= 0
#         pos=@start_position[index-1]
#         neigbous+=1 if (i-1) >= 0 && pos[i-1].eql?('*')
#         neigbous+=1 if pos[i].eql?('*')
#         neigbous+=1 if (i+1) <= limit && pos[i+1].eql?('*')
#     end
#     if (index+1) <= limit
#         pos=@start_position[index+1]
#         neigbous+=1 if (i-1) >= 0 && pos[i-1].eql?('*')
#         neigbous+=1 if pos[i].eql?('*')
#         neigbous+=1 if (i+1) <= limit && pos[i+1].eql?('*')
#     end
#     puts index
#     neigbous
# end

start_position = File.open('start_position.txt').read.split(' ')
# lives = start_position.map do |element|
#   element if element.include?('*')
# end
# puts lives
puts 'generation 1 '
puts start_position

start_position.each_with_index do |element, index|
  limit = element.length - 1
  limit.times do |i|
    neigbous = 0
    pos = start_position[index]
    neigbous += 1 if pos[i - 1].eql?('*') && (i - 1) >= 0
    neigbous += 1 if pos[i + 1].eql?('*') && (i + 1) <= limit
    if (index - 1) >= 0
      pos = start_position[index - 1]
      neigbous += 1 if pos[i - 1].eql?('*') && (i - 1) >= 0
      neigbous += 1 if pos[i].eql?('*')
      neigbous += 1 if pos[i + 1].eql?('*') && (i + 1) <= limit
    end
    if (index + 1) <= (start_position.length - 1)
      pos = start_position[index + 1]
      neigbous += 1 if pos[i - 1].eql?('*') && (i - 1) >= 0
      neigbous += 1 if pos[i].eql?('*')
      neigbous += 1 if pos[i + 1].eql?('*') && (i + 1) <= limit
    end
    element[i] = '*' if neigbous == 3
  end
end

puts 'generation 2 '
puts start_position
