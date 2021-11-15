require 'rails_helper'

RSpec.describe '/foods', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      get foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to the foods list' do
      food = FactoryBot.create(:food, user: @user)
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
