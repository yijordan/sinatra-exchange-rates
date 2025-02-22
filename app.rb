require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "dotenv/load"

get("/") do
  list_url = "https://api.exchangerate.host/list?access_key=" + ENV.fetch(EXCHANGE_KEY)
  HTTP.get(list_url)
  @currency = "asdf"
  erb(:homepage)
end
