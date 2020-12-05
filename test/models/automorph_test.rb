require 'test_helper'

class AutomorphTest < ActiveSupport::TestCase
  test 'add and search in db' do
    instance = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    assert instance.save
    assert_equal ActiveSupport::JSON.encode([[1, 1]]), Automorph.find_by(input: 1).result
  end

  test 'check adding not unique value' do
    instanse1 = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    instanse1.save
    instance2 = Automorph.new(input: 1, result: ActiveSupport::JSON.encode([[1, 1]]))
    instance2.validate
    assert_equal instance2.errors[:input], ['has already been taken']
  end
end
