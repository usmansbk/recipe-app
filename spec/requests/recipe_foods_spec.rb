require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      RecipeFood.create! valid_attributes
      get recipe_foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_food_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      recipe_food = RecipeFood.create! valid_attributes
      get edit_recipe_food_url(recipe_food)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new RecipeFood' do
        expect do
          post recipe_foods_url, params: { recipe_food: valid_attributes }
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the created recipe_food' do
        post recipe_foods_url, params: { recipe_food: valid_attributes }
        expect(response).to redirect_to(recipe_food_url(RecipeFood.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RecipeFood' do
        expect do
          post recipe_foods_url, params: { recipe_food: invalid_attributes }
        end.to change(RecipeFood, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post recipe_foods_url, params: { recipe_food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested recipe_food' do
        recipe_food = RecipeFood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the recipe_food' do
        recipe_food = RecipeFood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: new_attributes }
        recipe_food.reload
        expect(response).to redirect_to(recipe_food_url(recipe_food))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        recipe_food = RecipeFood.create! valid_attributes
        patch recipe_food_url(recipe_food), params: { recipe_food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe_food' do
      recipe_food = RecipeFood.create! valid_attributes
      expect do
        delete recipe_food_url(recipe_food)
      end.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects to the recipe_foods list' do
      recipe_food = RecipeFood.create! valid_attributes
      delete recipe_food_url(recipe_food)
      expect(response).to redirect_to(recipe_foods_url)
    end
  end
end
