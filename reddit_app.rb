require "unirest"

system "clear"
puts "Welcome to the Reddit App"

print "Please enter a subreddit you would like to view: "
input_subreddit = gets.chomp

response = Unirest.get("https://www.reddit.com/r/#{input_subreddit}/.json")
subreddit = response.body

number_of_topics = subreddit["data"]["children"].length - 1

index = 0
number_of_topics.times do
  p subreddit["data"]["children"][index]["data"]["title"]
  index += 1
end