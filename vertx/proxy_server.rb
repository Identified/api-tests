require "pp"
require "vertx"
include Vertx


HttpServer.new.request_handler do |req|
  puts "Proxying request: #{req.uri}"

  resp = req.response();
  
  case req.uri
  when '/'
    resp.put_header("Content-Type", "text/plain");
    resp.put_header("Content-Length", "hello there".length);
    resp.end("hello there");
  when '/v1/json'
    resp.put_header("Content-Type", "application/json");
    response_json = {str: 'hello there'}.to_json
    resp.put_header("Content-Length", response_json.length);
    resp.end(response_json);
  when '/v2/json'
    resp.put_header("Content-Type", "application/json");
    response_json = {str: 'hello there'}.to_json
    resp.put_header("Content-Length", response_json.length);
    resp.end(response_json);
  else
    puts "You gave me #{req.uri} -- I have no idea what to do with that."
  end

end.listen(8080)

