require './lib/enigma'
require './lib/cipher'
require './lib/algorithm'

enigma = Enigma.new

enigma.read
enigma.write_decryption
puts enigma.display_message