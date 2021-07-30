require_relative 'passport_processing'

array = Array.new(File.read('../day_04/4.txt').split(/\n\n/))
# array = Array.new(File.read('../day_04/4.txt').split(/^$/))

array_split = array.map { |s| s.split(/\p{Space}/)}

#PassportProcessing.passport_valid(array_split)
puts PassportProcessing.passport_field_valid(array_split)
puts PassportProcessing.passport_field_valid2(array_split)

