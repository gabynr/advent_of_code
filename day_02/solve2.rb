require_relative 'password_philosophy'

array = Array.new(File.read('../day_02/2.txt').split("\n"))
array_split = array.map { |s| s.split(":") }
list = array_split.map { |l| l[0] = l[0].split(" "); l}

#puts PasswordPhilosophy.count_valid_password(list)
puts PasswordPhilosophy.count_valid_password_new_interpretation(list)