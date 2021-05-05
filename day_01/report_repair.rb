# Advent of Code 2020 day 1
module ReportRepair
  RESULT = 2020
  def self.product(list)
    list_size = list.length - 1
    list_size.times do |i|
      list[(i + 1)..list_size].each do |num|
        return (list[i] * num) if (list[i] + num) == RESULT
      end
    end
  end

  def self.product3(list)
    list_size = list.length - 1
    list[0..(list_size - 2)].each.with_index do |fix1, i|
      list[(i + 1)..(list_size - 1)].each do |fix2|
        list[(i + 2)..list_size].each do |mov|
          return fix1 * fix2 * mov if fix1 + fix2 + mov == RESULT
        end
      end
    end
  end
end
