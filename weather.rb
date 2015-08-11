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
  weather = @client.lookup_by_location(location)
  return weather
end
  
def displayWeather(response)
  currentDay = Time.now.strftime("%w").to_i
  puts "currentDay = #{currentDay}"
   response.forecasts.each do |day|
     if day["date"].strftime("%w").to_i == currentDay
       puts "\tToday: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c. The current temperature is #{response.condition["temp"]}c."
     elsif day["date"].strftime("%w").to_i == currentDay + 1
       puts "\tTomorrow: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c."
     else
       puts "\t#{day["day"]}: #{day["text"]} with a low of #{day["low"]}c and a high of #{day["high"]}c."
     end
   end
   puts "\n\n"
end

location = getLocation
weather = getWeather(location)
displayWeather(weather)



