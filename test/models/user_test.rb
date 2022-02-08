# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def user
    users(:one)
  end

  test 'fixture must be valid' do
    assert user.valid?
  end

  test 'default role must be volunteer' do
    assert user.volunteer?
  end
end
