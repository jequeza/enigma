class Algorithm
  def initialize(parent)
    @cipher = parent
  end

  def keys
    {
      a_key: @cipher.key[0..1],
      b_key: @cipher.key[1..2],
      c_key: @cipher.key[2..3],
      d_key: @cipher.key[3..4]
    }
  end

  def square_date
    ((@cipher.date.to_i) ** 2).to_s
  end

  def offsets
    {
      a_offset: square_date[-4].to_i,
      b_offset: square_date[-3].to_i,
      c_offset: square_date[-2].to_i,
      d_offset: square_date[-1].to_i
    }
  end
end