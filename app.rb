require 'rubygems'
require 'sinatra'
require 'tilt/haml'
require 'app/models/TradeSystem/user'
require 'app/models/TradeSystem/item'
require 'app/models/TradeSystem/stock_market'
require 'app/controllers/main'
require 'app/controllers/authentication'


class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions

  configure :development do


    market=  TradeSystem::StockMarket.new_StockMarket
    @@stock_market = market
    @@stock_market.add_user(TradeSystem::User.named( 'Jack' ))
    @@stock_market.add_user(TradeSystem::User.named( 'Jill' ))
    @@stock_market.add_user(TradeSystem::User.named( 'ese' ))

    @@stock_market.traders[0].add_item('UBS', 25)
    @@stock_market.traders[0].add_item('Greece', 15)
    @@stock_market.traders[1].add_item('BP', 10)
    @@stock_market.traders[2].add_item('Duckfarm', 2)
    @@stock_market.traders[2].add_item('L.A', 30)

    @@stock_market.traders[0].activate_item(0)
    @@stock_market.traders[1].activate_item(0)
    @@stock_market.traders[2].activate_item(1)

  end



end

# Now, run it
App.run!