require './lib/enigma'
require './lib/cipher'

enigma = Enigma.new

enigma.read
enigma.write_encryption
puts enigma.display_message