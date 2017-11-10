require "unirest"

system "clear"
puts "Welcome to the Reddit App"

while true
  print "Please enter a subreddit you would like to view: "
  input_subreddit = gets.chomp

  response = Unirest.get("https://www.reddit.com/r/#{input_subreddit}/.json")
  subreddit = response.body

  number_of_topics = subreddit["data"]["children"].length - 1

  index = 0
  number_of_topics.times do
    puts "#{index + 1}. #{subreddit["data"]["children"][index]["data"]["title"]}"
    index += 1
  end

  print "Please enter the topic number you want to view: "
  input_topic_number = gets.chomp.to_i

  response = Unirest.get(subreddit["data"]["children"][input_topic_number - 1]["data"]["url"] + "/.json")
  comments = response.body

  index = 0
  puts
  5.times do
    puts "#{comments[1]["data"]["children"][index]["data"]["body"]}"
    puts
    index += 1
  end
  puts "Press 'q' to quit or any other key to start again"
  input_option = gets.chomp
  if input_option == "q"
    break
  end
end
