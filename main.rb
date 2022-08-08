# frozen_string_literal: true

start_position = File.open('start_position.txt').read.split(' ')
# lives = start_position.map do |element|
#   element if element.include?('*')
# end
# puts lives
puts start_position
