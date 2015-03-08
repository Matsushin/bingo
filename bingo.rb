class Bingo
  def self.generate_card
    cols = (1..75).each_slice(15).map { |col| col.sample(5) }
    cols[2][2] = ""

    table = ["BINGO".chars] + cols.transpose
    table.map { |row|
      row.map { |cell| cell.to_s.rjust(2) }.join(" | ")
    }.join("\n")
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

Bingo.generate_card