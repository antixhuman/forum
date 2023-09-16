require "roda"
require "./api"

class App < Roda
  plugin :public

  route do |r|
    r.root do
      r.redirect "/index.html"
    end

    r.on "api" do
      r.run Api.app
    end

    r.public
  end
end