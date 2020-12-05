require 'test_helper'

class LogicControllerTest < ActionDispatch::IntegrationTest

  test 'should get view' do
    get logic_view_url, params: { limit: 5 }
    assert_response :success
  end

  test 'should cache result in db' do
    before = Automorph.count
    get logic_view_url, params: { limit: 30 }
    after = Automorph.count

    assert_equal before + 1, after
  end

  test 'should respond with different results' do
    get logic_view_url, params: { limit: 100, format: 'json' }
    first = JSON.parse @response.body

    get logic_view_url, params: { limit: 1, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end
end
