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

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Food' do
        expect do
          post foods_url, params: { food: FactoryBot.create(:food) }
        end.to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested food' do
      food = FactoryBot.create(:food)
      expect do
        delete food_url(food)
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      food = FactoryBot.create(:food)
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
