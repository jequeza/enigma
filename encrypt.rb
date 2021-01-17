require './lib/enigma'
require './lib/cipher'

enigma = Enigma.new

enigma.read
enigma.write
puts enigma.display_message