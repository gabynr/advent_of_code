module CustomCustoms
  SERIES = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

  def self.sum_count(arr)
    sum = 0
    arr.each { |l|
      n = l.uniq
      n.each { |t|
        sum += 1 if  SERIES.include?(t)
      }
    }
    sum
  end

  end
