#weather.rb
#Chris Chapman August 9, 2015

#get gem(s)
require 'yahoo_weatherman'

def getLocation
  print "What is the location you're interested in? "
  location = gets.chomp
  return location
end

def getWeather(location)
  @client = Weatherman::Client.new
  response = @client.lookup_by_location(location)
  puts "\n\nThe weather forecast for #{response.location["city"]}, #{response.location["region"]} is:\n\n"

  currentDay = Time.now.strftime("%w").to_i
   response.forecasts.each do |day|
     if day["date"].strftime("%w").to_i == 0
       puts "\tToday: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c. The current temperature is #{response.condition["temp"]}c."
     elsif day["date"].strftime("%w").to_i == 1
       puts "\tTomorrow: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c."
     else
       puts "\t#{day["day"]}: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c."
     end
   end
   puts "\n\n"
end

location = getLocation
getWeather(location)



