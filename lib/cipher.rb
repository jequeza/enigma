class Cipher
  attr_reader :key,
              :message,
              :alphabet

  def initialize
    @message = "" #['hello world']
    @key = ''
    @alphabet = ('a'..'z').to_a << ' '
    @al = Algorithm.new(self)
  end

  def five_digit_number
    num = Array.new(5) { rand(0...9) }
    num_joined = num.join
    @key = num_joined
    num_joined
  end

  def date
    Time.now.strftime("%d%m%y")
  end

  # def a_key
  #   @key[0..1]
  # end

  # def b_key
  #   @key[1..2]
  # end

  # def c_key
  #   @key[2..3]
  # end

  # def d_key
  #   @key[3..4]
  # end

  # def date_squared
  #   (date ** 2).to_s
  # end

  # def four_digit_number
  #   date_squared[-4, 4]
  # end

  # def a_offset
  #   four_digit_number[0].to_i
  # end

  # def b_offset
  #   four_digit_number[1].to_i
  # end
  #
  # def c_offset
  #   four_digit_number[2].to_i
  # end
  #
  # def d_offset
  #   four_digit_number[3].to_i
  # end

  def shifts
    @al.shifts
  end

  def alphabet_length
    @alphabet.length
  end

  def index_to_letters
    index_letters = {}
    alphabet.each.with_index(1) do |letter, index|
      index_letters[index] = letter
    end
    index_letters
  end

  def letters_to_index
    letter_indexes = {}
    alphabet.each.with_index(1) do |letter, index|
      letter_indexes[letter] = index
    end
    letter_indexes
  end

  def big_shift?(shift, index)
    ((shift % alphabet_length) + index ) > alphabet_length
  end

  def shift_amount_left(shift, index)
    if shift == index
      index
    else
      (alphabet_length - (shift - index)) % alphabet_length
    end
  end

  def shift_amount(shift, index)
    if big_shift?(shift, index)
      (shift % alphabet_length) - alphabet_length + index
    else
      (shift % alphabet_length)
    end
  end

  def shift(message)
    hash = {}
    shift_collection = [3, 27, 73, 20]
    i = 0
    message[0].chars.each.with_index(1) do |letter, index|
      hash[index] = shift_collection[i]
      i += 1
      if i == shift_collection.length
        i = 0
      end
    end
    hash
  end

  def letters_in_message
    @message[0].chars
  end

  def encrypt(message)
    out_message = ""
    message[0].chars.each.with_index(1) do |letter, index|
      i = 1
      if alphabet.include?(letter) && !big_shift?(shift(message)[index], letters_to_index[letter])
        out_message += index_to_letters[letters_to_index[letter] + shift_amount(shift(message)[index], letters_to_index[letter])]
        i += 1
      elsif alphabet.include?(letter) && big_shift?(shift(message)[index], letters_to_index[letter])
        out_message += index_to_letters[shift_amount(shift(message)[index], letters_to_index[letter])]
        i += 1
      else
        out_message += letter
        i += 1
      end
    end
    out_message
  end

  def decrypt(message)
    out_message = ""
    message[0].chars.each.with_index(1) do |letter, index|
      i = 1
      if alphabet.include?(letter)
        out_message += index_to_letters[shift_amount_left(shift(message)[index], letters_to_index[letter])]
        i += 1
      else
        out_message += letter
        i += 1
      end
    end
    out_message
  end
end