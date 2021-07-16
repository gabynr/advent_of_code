module PassportProcessing
  def self.passport_valid field
    count = 0
    field.each do |f|
      count_valid = 0
      f.each do |v|
        count_valid += 1 if v.include?(:byr)
        count_valid += 1 if v.include?(:iyr)
        count_valid += 1 if v.include?(:eyr)
        count_valid += 1 if v.include?(:hgt)
        count_valid += 1 if v.include?(:hcl)
        count_valid += 1 if v.include?(:ecl)
        count_valid += 1 if v.include?(:pid)
      end
      count += 1 if count_valid == 7
    end
    count
  end
end
