#
module BinaryBoarding

  def self.binary_space_partitioning(arg)
    rang = []

    arg.take(7).each_with_index do |item,index|
      rang = intial_rang(item) if index == 0
      rang = calcule_row(item,rang,index) if index >=1 && index <= 5
      rang = zone(item,rang) if index == 6
    end
    rang
  end

  def self.intial_rang(letter)
    ran = []
    case letter
    when "F"
      ran = [0,63]
    when "B"
      ran = [64,127]
    end
    ran
  end

  def self.calcule_row(letter,rang,index)
    new_rang = []
    h = {"1" => 31, "2" => 15, "3" => 7, "4" => 3, "5" => 1}

    case letter
    when "F"
      new_rang[0] = rang[0]
      new_rang[1] = rang[0] + h[index.to_s]
    when "B"
      new_rang[0] = rang[1] - h[index.to_s]
      new_rang[1] = rang[1]
    end
    new_rang
  end

  def self.zone(letter,rang)
    zone = 0
    case letter
    when "F"
      zone = rang[0]
    when "B"
      zone = rang[1]
    end
    zone
  end

  def calcule_column(letter,index)
    rang = [0,7]
    p = {"0" => 3, "1" => 1}
    case letter
    when "R"
      rang[0] = rang[1] - p[index.to_s]
      rang[1] = rang[1]
    when "L"
      rang[0] = rang[0]
      rang[1] = rang[0] + p[index.to_s]
    end
    rang
  end

  def value_final_cloumn(letter,rang)
    value = 0
    case letter
    when "R"
      value = rang[1]
    when "L"
      value = rang[0]
    end
    value
  end
end