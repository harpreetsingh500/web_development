require 'pry'
require 'socket'

server = TCPServer.new("localhost", 3003)
#binding.pry

loop do
  client = server.accept
  client.puts "Hello !"
  client.puts "Time is #{Time.now}"
  client.close
end
