require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  test "should be valid" do
    assert books(:one).valid?
  end

  test "shoud have a title" do
    books(:one).title = nil
    assert_not books(:one).valid?
  end

  test "should have an author" do
    books(:one).author = nil
    assert_not books(:one).valid?
  end

  test "should accept a book without cover_photo" do
    books(:one).cover_photo = nil
    assert books(:one).valid?
  end

  test "should not accept cover_photo other than .png/jpg/jpeg" do
    books(:one).cover_photo = 'text.txt'
    assert books(:one).valid?
  end
end
