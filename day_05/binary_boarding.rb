#
module BinaryBoarding

  def self.seat_id(arg)
    highest_id = 0
    arg.each { |a|
      set_id = (row(a) * 8) + column(a)
      highest_id  = set_id if  set_id > highest_id
    }
    highest_id
  end

  def self.column(arg)
    rang_column = []
    column = 0
    rang = [0,7]
    array_colum = arg.drop(7)
    array_colum.each_with_index do |item,index|
      rang_column = calcule_column(item,index,rang) if index <= 1
      column = final_cloumn(item,rang_column) if index == 2
    end
    column
  end

  def self.row(arg)
    row = 0
    rang_row_init = []
    arg.take(7).each_with_index do |item,index|
      rang_row_init = intial_rang_row(item,rang_row_init) if index == 0
      rang_row_init = calcule_row(item,index,rang_row_init) if index >=1 && index <= 5
      row = final_row(item,rang_row_init) if index == 6
    end
    row
  end

  def self.intial_rang_row(letter,rang)
    case letter
    when "F"
      rang = [0,63]
    when "B"
      rang = [64,127]
    end
    rang
  end

  def self.operando(i)
    n = 6
    2**(n-i) - 1
  end

  def self.calcule_row(letter,index,rang_row)
    # h = {"1" => 31, "2" => 15, "3" => 7, "4" => 3, "5" => 1}
    case letter
    when "F"
      rang_row[0] = rang_row[0]
      # rang_row[1] = rang_row[0] + h[index]
      rang_row[1] = rang_row[0] + operando(index)
    when "B"
      # rang_row[0] = rang_row[1] - h[index]
      rang_row[0] = rang_row[1] - operando(index)
      rang_row[1] = rang_row[1]
    end
    rang_row
  end

  def self.final_row(letter,rang)
    row = 0
    case letter
    when "F"
      row = rang[0]
    when "B"
      row = rang[1]
    end
    row
  end

  def self.calcule_column(letter,index,rang_column)

    p = {"0" => 3, "1" => 1}
    case letter
    when "R"
      rang_column[0] = rang_column[1] - p[index.to_s]
      rang_column[1] = rang_column[1]
    when "L"
      rang_column[0] = rang_column[0]
      rang_column[1] = rang_column[0] + p[index.to_s]
    end
    rang_column
  end

  def self.final_cloumn(letter,rang)
    column = 0
    case letter
    when "R"
      column = rang[1]
    when "L"
      column = rang[0]
    end
    column
  end
end