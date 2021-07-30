module PassportProcessing
  VALID_KEYS = %w{ byr iyr eyr hgt hcl ecl pid }
  EYE_COLOR = %w{ amb blu brn gry grn hzl oth }

  def self.passport_valid field
    count = 0
    field.each do |f|
      count_valid = 0
      f.each do |k|
        key = k.split(':')[0]
        count_valid = +1 if VALID_KEYS.include?(key)
      end
      count += 1 if count_valid == 7
    end
    count
  end

  def self.passport_field_valid field
    count = 0
    field.each do |f|
      count_valid = 0
      f.each do |k|
        key = k.split(':')[0]
        value = k.split(':')[1]
        # key, value = k.split(':')
        case key
        when 'byr'
          count_valid += 1 if (value.to_i >= 1920) && (value.to_i <= 2002)

        when 'iyr'
          count_valid += 1 if (value.to_i >= 2010) && (value.to_i <= 2020)

        when 'eyr'
          count_valid += 1 if (value.to_i >= 2020) && (value.to_i <= 2030)

        when 'ecl'
          count_valid += 1 if EYE_COLOR.include?(value)

        when 'pid'
          count_valid += 1 if value.length == 9 && value[/\d+/]

        when 'hcl'
          count_valid += 1 if value =~  /^#[:xdigit:]*/

        when 'hgt'
          count_valid += 1 if (value =~ /cm$/ && value[0..3].to_i >= 150 && value[0..3].to_i <= 193) ||
                              (value =~ /in$/ && value[0..2].to_i >= 59 && value[0..2].to_i <= 76)

        end
      end
      count += 1 if count_valid == 7
    end
    count
  end

  def self.passport_field_valid2 field
    count = 0
    field.each do |f|
      count_valid = 0
      f.each do |k|
        key, value = k.split(':')
        next unless VALID_KEYS.include?(key)

        is_valid = send("validate_#{key}".to_sym, value)

         count_valid += 1 if is_valid
      end
      count += 1 if count_valid == 7
    end
    count
  end

  class << self
    def validate_byr value
      (value.to_i >= 1920) && (value.to_i <= 2002)
    end

    def validate_iyr value
      (value.to_i >= 2010) && (value.to_i <= 2020)
    end

    def validate_eyr value
      (value.to_i >= 2020) && (value.to_i <= 2030)
    end

    def validate_ecl value
      EYE_COLOR.include?(value)
    end

    def validate_pid value
      !!(value.length == 9 && value[/\d+/])
    end

    def validate_hcl value
      !!(value =~ /^#[:xdigit:]*/)
    end

    def validate_hgt value
      (value =~ /cm$/ && value[0..3].to_i >= 150 && value[0..3].to_i <= 193) ||
        (value =~ /in$/ && value[0..2].to_i >= 59 && value[0..2].to_i <= 76)
    end
  end
end
