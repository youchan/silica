require 'bundler/setup'
Bundler.require(:default)

require 'menilite'

require_relative 'server'

app = Rack::Builder.app do
  server = Server.new(host: 'localhost')

  map '/' do
    run server
  end

  map '/assets' do
    run Server::OPAL.sprockets
  end

  map '/__OPAL_SOURCE_MAPS__' do
    run Opal::SourceMapServer.new(Server::OPAL.sprockets, '/__OPAL_SOURCE_MAPS__')
  end

  map '/api' do
    router = Menilite::Router.new
    run router.routes(server.settings)
  end
end

Rack::Server.start({
  app:    app,
  server: 'thin',
  Host:   '0.0.0.0',
  Port:   9292,
  signals: false,
})
