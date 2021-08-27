require_relative 'binary_boarding'

array = Array.new(File.read('../day_05/5.txt').split(/\n/))
array_map = array.map { |a| a.split('')}

puts BinaryBoarding.seat_id(array_map)

