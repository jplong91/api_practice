require "unirest"

puts "This is a Dictionary App... Prepare yourself"
print "Want me to look up a word for you? Feed me something: "
input_word = gets.chomp

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
body = response.body

definition = body[0]["text"]
puts "Definition: #{definition.downcase}"