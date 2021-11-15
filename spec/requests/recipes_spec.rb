require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      recipe = FactoryBot.create(:recipe)
      get recipe_url(recipe)
      expect(response).to be_successful
    end

    it 'cant access private recipe' do
      recipe = FactoryBot.create(:recipe, public: false)
      expect { get recipe_url(recipe) }.to raise_error 'You are not authorized to access this page.'
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'redirects to the created recipe' do
        post recipes_url, params: { recipe: FactoryBot.build(:recipe, user: @user) }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to the recipes list' do
      recipe = FactoryBot.create(:recipe, user: @user)
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end

    it 'cant delete un-authorized recipe' do
      recipe = FactoryBot.create(:recipe)
      expect { delete recipe_url(recipe) }.to raise_error 'You are not authorized to access this page.'
    end
  end
end
