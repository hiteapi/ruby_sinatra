require 'sinatra'

# database

greetings = [
  {},
  {:label => "Hello, world!"}
]

get '/greetings/1' do
  content_type :json
  greetings[1].to_json
end
