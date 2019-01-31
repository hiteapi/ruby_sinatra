ENV['APP_ENV'] = 'test'

require_relative 'lib/hello_world'
require 'test/unit'
require 'rack/test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    expectedBodyJSON = File.read(File.expand_path(File.dirname(__FILE__) + '/fixtures/hello_world.json'))
    @expectedBody = JSON.parse(expectedBodyJSON)
  end

  def test_hello_world
    get '/greetings/1'
    assert last_response.ok?
    assert_equal 'application/json', last_response.headers['Content-Type']
    assert_equal @expectedBody['label'], JSON.parse(last_response.body)['label']
  end

end
