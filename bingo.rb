class Bingo
  BINGO_MAPS = %w(B I N G O)
  ROW_NUMBER = 6
  ROW_RANGE = 15

  def self.generate_card
    card = ''
    ROW_NUMBER.times do |row_index|
      BINGO_MAPS.each_with_index{|item, col_index|
        boundary = col_index == BINGO_MAPS.size - 1 ? '' : ' | '
        str = ''
        unless row_index == ROW_NUMBER / 2 && col_index == (BINGO_MAPS.size / 2).ceil
          str =  row_index == 0 ? item : self.generate_number(col_index + 1, card).to_s
        end
        card += "%2s" % str + boundary
      }
      card += "\n"
    end
    card
  end

  def self.generate_number(index, inspection)
    number = index * ROW_RANGE - rand(ROW_RANGE - 1)
    return self.generate_number(index, inspection) if inspection.include?("#{'%2s' % number.to_s}")
    number
  end

  def self.sample
    <<-CARD
 B |  I |  N |  G |  O
13 | 22 | 32 | 48 | 61
 3 | 23 | 43 | 53 | 63
 4 | 19 |    | 60 | 65
12 | 16 | 44 | 50 | 75
 2 | 28 | 33 | 56 | 68
    CARD
  end
end