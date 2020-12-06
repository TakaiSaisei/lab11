# frozen_string_literal: true

require 'test_helper'

class AutomorphTest < ActiveSupport::TestCase
  test 'add and search in db' do
    result = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    assert result.save
    assert_equal ActiveSupport::JSON.encode([[1, 1]]), Automorph.find_by(input: 1).result
  end

  test 'check adding not unique value' do
    result_first = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    result_first.save
    result_second = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    result_second.validate
    assert_equal result_second.errors[:input], ['has already been taken']
  end
end
