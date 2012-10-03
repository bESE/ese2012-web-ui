require 'App/models/TradeSystem/stock_market'

module TradeSystem

  class User


    # class variable
    @@users = Array.new

    attr_accessor :name, :credit , :items

    # factory method (constructor) on the class
    def self.named( name )
      user = self.new
      user.name = name
      user
    end

    def initialize
      self.items = Array.new
      self.credit= 100
    end

    def self.all
      @@users
    end

    def self.by_name name
      @@users.detect {|user| user.name == name }
    end

    # add the instance to the list
    def save
      @@users.push self
    end

    def add_Item(name, price)
      item =  TradeSystem::Item.named(name,price, self.name)
      items.push(item)
      items
    end

    def activate_item(index)
      items[index].change_activity
    end

    def delete_item(item)
      index = 0
      while(index <= items.length)
        if(items[index].name == item.name)
          items.delete_at(index)
          items.compact
        end
        index += 1
      end

    end

    def list_all_active_items()
      active_items = Array.new
      index = 0
      while (index <= items.length-1)
        if items[index].state == 'active'
          active_items.push(items[index])
        end
        index+1
      end
      active_items
    end

    def buy(name,stock_market)
      stock_market.trade(name, self)
    end

  end
end
