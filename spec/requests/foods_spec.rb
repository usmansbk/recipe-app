require 'rails_helper'

RSpec.describe '/foods', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      Food.create! valid_attributes
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
          post foods_url, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the created food' do
        post foods_url, params: { food: valid_attributes }
        expect(response).to redirect_to(food_url(Food.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Food' do
        expect do
          post foods_url, params: { food: invalid_attributes }
        end.to change(Food, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post foods_url, params: { food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect do
        delete food_url(food)
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      food = Food.create! valid_attributes
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
