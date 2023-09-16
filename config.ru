require "rack"
require "./app"

use Rack::Reloader

run App.app