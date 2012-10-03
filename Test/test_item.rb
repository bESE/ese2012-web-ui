require 'test/unit'
require 'App/models/TradeSystem/item'


class TestItem < Test::Unit::TestCase

  def test_name
    item = WARMUP::Item.named('slave',10, 'John')
    assert_equal(String(item.name), 'slave', '' )
    assert_equal(item.state,'inactive','^^')
    item.change_activity
    assert_equal(item.state,'active','^^')

  end

  def test_owner
    item = WARMUP::Item.named('slave',10, 'John')
    assert_equal(String(item.owner), 'John', 'Slavemaster John ')
    assert_equal(Integer(item.price), 10, '')
end


end



