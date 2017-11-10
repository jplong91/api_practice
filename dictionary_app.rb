require "unirest"

puts "This is a Dictionary App... Prepare yourself"
print "Want me to look up a word for you? Feed me something: "
input_word = gets.chomp

response_definition = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
definition_body = response_definition.body
definition = definition_body[0]["text"]

response_top_example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
top_example_body = response_top_example.body
top_example = top_example_body["text"]

response_pronounciation = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
pronounciation_body = response_pronounciation.body
pronounciation = pronounciation_body[0]["raw"]

puts "Definition: #{definition.downcase}"
puts "In a sentence... #{top_example}"
puts "Prounciation: #{pronounciation}"