require './lib/enigma'

enigma = Enigma.new

ARGV == ["message.txt","encrypted.txt"]

message = File.open("./lib/" + ARGV[0])
encrypted = enigma.encrypt(message.read)

File.open("./lib/" + ARGV[1], "w").write(encrypted[:encryption])
puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"