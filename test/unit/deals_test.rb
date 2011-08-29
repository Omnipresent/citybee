require 'test_helper'

class DealsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Deals.new.valid?
  end
end
