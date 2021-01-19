class Cipher
  attr_reader :key,
              :alphabet,
              :al,
              :date

  def initialize
    @key = ''
    @alphabet = ('a'..'z').to_a << ' '
    @al = Algorithm.new(self)
    @date = ''
  end

  def five_digit_number
    num = Array.new(5) { rand(0...9) }
    num_joined = num.join
    @key = num_joined
  end

  def get_date
    @date = Time.now.strftime("%d%m%y")
  end

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
    shift_collection = shifts.values
    i = 0
    message.chars.each.with_index(1) do |letter, index|
      hash[index] = shift_collection[i]
      i += 1
      if i == shift_collection.length
        i = 0
      end
    end
    hash
  end

  def encrypt(message, key_in=@key, date_in=get_date)
    @key = key_in if !key_in.empty?
    @date = date_in if !date_in.empty?
    out_message = ""
    message.chars.each.with_index(1) do |letter, index|
      if alphabet.include?(letter) && !big_shift?(shift(message)[index], letters_to_index[letter])
        out_message += index_to_letters[letters_to_index[letter] + shift_amount(shift(message)[index], letters_to_index[letter])]
      elsif alphabet.include?(letter) && big_shift?(shift(message)[index], letters_to_index[letter])
        out_message += index_to_letters[shift_amount(shift(message)[index], letters_to_index[letter])]
      else
        out_message += letter
      end
    end
    out_message
  end

  def decrypt(message, key_in=@key, date_in=get_date)
    @key = key_in if !key_in.empty?
    @date = date_in if !date_in.empty?
    out_message = ""
    message.chars.each.with_index(1) do |letter, index|
      if alphabet.include?(letter)
        out_message += index_to_letters[shift_amount_left(shift(message)[index], letters_to_index[letter])]
      else
        out_message += letter
      end
    end
    out_message
  end
end