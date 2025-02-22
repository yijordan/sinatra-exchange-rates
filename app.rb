require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "dotenv/load"

get("/") do
  @list_url = "https://api.exchangerate.host/list?access_key=" + ENV.fetch("EXCHANGE_KEY")
  @resp = HTTP.get(@list_url)
  @raw_response = @resp.to_s
  @parsed_response = JSON.parse(@raw_response)
  @currencies = @parsed_response.fetch("currencies")
  erb(:homepage)
end
