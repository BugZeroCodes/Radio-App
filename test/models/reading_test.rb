require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  test 'it has a valid factory' do
    assert build(:reading).valid?
  end
end
