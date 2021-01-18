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
end