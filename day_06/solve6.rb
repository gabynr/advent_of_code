require_relative 'custom_customs'

array = Array.new(File.read('../day_06/6.txt').split(/\n\n/))


array_separ = array.map { |a| a.split(//)}


#final_array = array_separ.map { |s| s.split(/\p{Space}/)}








puts CustomCustoms.sum_count(array_separ)
