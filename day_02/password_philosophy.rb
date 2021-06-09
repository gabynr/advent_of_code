# Advent of Code 2020 day 2
module PasswordPhilosophy

  def self.count_valid_password(list)
    #list.each_with_index do |e,index| puts index, (e[0][0]).gsub(/[-]/, '..'),(e[1].count(e[0][1])) end
    result = 0
    list.each do |e|
      password = e[1]
      policy_char = e[0][1]
      policy_range = e[0][0].split("-").map(&:to_i)
      policy_min = policy_range[0]
      policy_max = policy_range[1]
      count_char_in_password = password.count(policy_char)
      result += 1 if (policy_min..policy_max).include?(count_char_in_password)
    end
    result
  end

  def self.count_valid_password_new_interpretation(list)
    result = 0
    list.each do |e|
      password = e[1]
      policy_char = e[0][1]
      policy_range = e[0][0].split("-").map(&:to_i)
      policy_min = policy_range[0]
      policy_max = policy_range[1]
      result += 1 if (password[policy_min] == policy_char) ^ (password[policy_max] == policy_char)
    end
    result
  end
end