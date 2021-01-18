require './lib/enigma'
require './lib/cipher'
require './lib/algorithm'

enigma = Enigma.new

enigma.read
enigma.write_encryption
puts enigma.display_message