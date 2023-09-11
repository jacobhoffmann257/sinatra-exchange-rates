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
get("/:code") do 
  @code1 = params.fetch("code")
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
erb(:secondcurrency)
end
get("/:code1/:code2") do
  code1 = params.fetch("code1")
  @code1http = code1
  code2 = params.fetch("code2")
  @code2http = code2
  converturl = "https://api.exchangerate.host/convert?from=#{code1}&to=#{code2}"
  rawconvert = HTTP.get(converturl)
  parsed_convert = JSON.parse(rawconvert)
  conversioninfo = parsed_convert.fetch("info")
  @rate = conversioninfo.fetch("rate")
  puts @rate
  erb(:conversion)
end
