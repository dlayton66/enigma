require './lib/enigma'

enigma = Enigma.new

encrypted = File.open("./lib/" + ARGV[0])
cracked = enigma.crack(encrypted.read,ARGV[2])

File.open("./lib/" + ARGV[1], "w").write(cracked[:decryption])
puts "Created '#{ARGV[1]}' with the cracked key #{cracked[:key]} and date #{ARGV[2]}"