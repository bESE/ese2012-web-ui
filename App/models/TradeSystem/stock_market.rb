require 'App/models/TradeSystem/user'
require 'App/models/TradeSystem/item'

class StockMarket


  attr_accessor :traders, :for_sale, :to_trade

  def self.new_StockMarket()
    stock_market = self.new
    stock_market
  end

  def initialize
    self.traders = Array.new
    self.for_sale = Array.new
  end

  def add_user(user)
    traders.push(user)
  end

  def show_traders
    puts traders
  end

  def get_tradeables
    for_sale=[]
    for user in self.traders do
      for_sale = for_sale + user.get_active_items
    end
    for_sale
  end

  def trade(name, user)
    for_sale=get_tradeables

    to_trade = for_sale.find{ |item| item.name == name }

    if to_trade.price > user.credit

      puts 'not enough credits'
    else
      deal(to_trade, user)
    end
  end

  def deal(item, user)
    buyer = user
    seller_name = item.owner
    seller= nil
    for user in self.user_list
      if user.name.equal?(seller_name)
        seller=user
      end
    end

    buyer.credit -= item.price
    seller.credit += item.price
    buyer.add_item(item, item.price)
    seller.delete_item(item)

    item.change_activity

  end



end