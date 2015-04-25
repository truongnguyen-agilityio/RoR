require 'test_helper'
require "faker"

class ItemsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.todos-api.com'}

	test 'get all todos' do
		user = User.create!(email: Faker::Internet.email, password:  Faker::Internet.password)
		2.times do
			completed = rand(2) == 1 ? true : false
			user.items << Item.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, completed: completed)
		end
		url = '/v1/items?auth_token=' + user.auth_token
		get url
		items = user.items.map { |e| {id: e[:id], name: e[:name], description: e[:description], completed: e[:completed]} }
		assert_equal 200, response.status
		assert_equal response.body, items.to_json
	end
end
