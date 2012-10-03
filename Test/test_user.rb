require 'test/unit'
require 'warmup/user'

class TestUser < Test::Unit::TestCase

  def test_setup
    user = WARMUP::User.named('Link')
    assert_equal(String(user.name), 'Link')
    assert_equal(Integer(user.credit), 100)
    assert_equal(Integer(user.items.length), 0)
  end

  def test_add_and_activate_item
    user = WARMUP::User.named('Link')
    user.add_Item('slaves', 50)
    assert_not_nil(user.items[0])
    user.items[0].change_activity
    assert(user.items[0].state == 'active')



  end




end