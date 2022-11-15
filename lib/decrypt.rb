require './lib/enigma'

enigma = Enigma.new

ARGV == ["encrypted.txt","decrypted.txt","key","date"]

encrypted = File.open("./lib/" + ARGV[0])
decrypted = enigma.decrypt(encrypted.read,ARGV[2],ARGV[3])

File.open("./lib/" + ARGV[1], "w").write(decrypted[:decryption])
puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"