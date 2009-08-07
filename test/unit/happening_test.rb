require 'test_helper'

class HappeningTest < ActiveSupport::TestCase
  fixtures :all
  
  def test_to_s
    e = Happening.find(1)
    assert_equal e.to_s, 'MyString'
  end
  
end
