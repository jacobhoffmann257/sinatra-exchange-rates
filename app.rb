require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
get("/") do
  symbolsurl = "https://api.exchangerate.host/symbols" 
  rawsymbols = HTTP.get(symbolsurl)
  parsed_symbols = JSON.parse(rawsymbols)
  symbols_list = parsed_symbols.fetch("symbols");
  @symbols_array = []
  symbols_list.each do |x,y|
  @symbols_array.push(y)
  end
  puts @symbols_array
  erb(:firstcurrency)
end
