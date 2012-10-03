require 'tilt/haml'
require 'app/app'
require 'app/models/store/item'
require 'app/models/store/user'
require 'app/models/store/market'


class Trade < Sinatra::Application

  get '/buy' do
    redirect "/"
  end

  post '/buy' do
    owner_name = params[:name_owner]
    item_name = params[:item_name]
    user_name = session[:name]
    owner = TradeSystem::User.by_name(owner_name)
    user = TradeSystem::User.by_name(user_name)


    item = owner.item_list.detect { |temp_item| temp_item.name == item_name }

    fail "Item doesn't exist" if item == nil

    user.buy(item_name, @@market)

    redirect "/"
  end

end