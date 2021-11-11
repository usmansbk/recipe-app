require 'rails_helper'

RSpec.describe FoodRecipesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/food_recipes').to route_to('food_recipes#index')
    end

    it 'routes to #new' do
      expect(get: '/food_recipes/new').to route_to('food_recipes#new')
    end

    it 'routes to #show' do
      expect(get: '/food_recipes/1').to route_to('food_recipes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/food_recipes/1/edit').to route_to('food_recipes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/food_recipes').to route_to('food_recipes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/food_recipes/1').to route_to('food_recipes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/food_recipes/1').to route_to('food_recipes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/food_recipes/1').to route_to('food_recipes#destroy', id: '1')
    end
  end
end
