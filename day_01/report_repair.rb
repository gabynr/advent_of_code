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

  def self.hash_product(list)
    h = Hash.new
    list.each do |fix|
      return (RESULT - fix) * fix if h.keys.include?(fix)

      h[RESULT - fix] = 1
    end
  end

  def self.hash_product3(list)
    #h = Hash.new
    list_size = list.length - 2
    list[0..list_size].each_with_index do |fix, index|
      h = Hash.new
      list[(index + 2)..list_size].each do |mov|
        #puts " index, #{index}, fix, #{fix},  fix2 #{list[index+1]}, mov, #{mov}), h.keys: #{h.keys.join(',')}"
        return(fix * list[index+1] * mov) if h.keys.include?(mov)

        h[2020 - (fix + list[index+1])] = 1
      end
    end
  end

  def self.hash_product3e(list)
    list_size = list.length - 1
    list.each_with_index do |fix1, i|
      h = Hash.new
      list[(i + 1)..list_size].each do |fix2|
        puts " i, #{i}, fix1, #{fix1},  fix2 #{fix2}, (RESULT - fix1 - fix2), #{(RESULT - fix1 - fix2)}), h.keys: #{h.keys.join(',')}"
        return (RESULT - fix1 - fix2) * fix2 * fix1 if h.keys.include?(fix2)

        h[RESULT - fix1 - fix2] = 1
      end
    end
  end
end
