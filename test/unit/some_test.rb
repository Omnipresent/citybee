require 'test_helper'

class SomeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Some.new.valid?
  end
end
