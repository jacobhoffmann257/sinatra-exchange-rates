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
  @code_list = []
  @symbols_array.each do |x,y|
  @code_list.push( x.fetch("code"))
  end
  erb(:firstcurrency)
end
