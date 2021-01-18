class Algorithm
  def initialize(parent)
    @cipher = parent
  end

  def keys
    {
      a: @cipher.key[0..1],
      b: @cipher.key[1..2],
      c: @cipher.key[2..3],
      d: @cipher.key[3..4]
    }
  end

  def square_date
    ((@cipher.date.to_i) ** 2).to_s
  end

  def offsets
    {
      a: square_date[-4].to_i,
      b: square_date[-3].to_i,
      c: square_date[-2].to_i,
      d: square_date[-1].to_i
    }
  end

  def shifts
    all_shifts = {}
    all_shifts[:a] = keys[:a].to_i + offsets[:a]
    all_shifts[:b] = keys[:b].to_i + offsets[:b]
    all_shifts[:c] = keys[:c].to_i + offsets[:c]
    all_shifts[:d] = keys[:d].to_i + offsets[:d]
    all_shifts
  end
end