require "unirest"

system "clear"
puts "Welcome to the Reddit App"

print "Please enter a subreddit you would like to view: "
input_subreddit = gets.chomp

response = Unirest.get("https://www.reddit.com/r/#{input_subreddit}/.json")