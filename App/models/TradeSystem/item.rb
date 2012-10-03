module TradeSystem

  class Item

    attr_accessor :name, :price , :owner , :state

    # factory method (constructor) on the class
    def self.named( name, price, owner)
      item = self.new
      item.name = name
      item.price = price
      item.owner = owner
      item.state = 'inactive'
      item
    end

    def to_s
      # string interpolation
      "buy #{name} for #{price} from #{owner}"
    end

    def change_activity
      self.state == 'inactive' ? self.state = 'active' : self.state = 'inactive'
    end

  end

end