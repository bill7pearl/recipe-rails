require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of current user\'s foods' do
      user = User.create(email: 'test@example.com', password: 'password')
      food1 = user.foods.create(name: 'Food 1', price: 100)
      food2 = user.foods.create(name: 'Food 2', price: 200)

      sign_in(user)
      get :index
      expect(assigns(:foods)).to match_array([food1, food2])
    end
  end

  describe 'GET #new' do
    it 'creates a new food item for the current user' do
      user = User.create(email: 'test@example.com', password: 'password')
      sign_in(user)

      get :new
      expect(assigns(:food)).to be_a_new(Food)
      expect(assigns(:food).user).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new food item for the current user' do
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in(user)

        expect {
          post :create, params: { food: { name: 'New Food', price: 300 } }
        }.to change(user.foods, :count).by(1)

        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid params' do
      it 'renders the new template' do
        user = User.create(email: 'test@example.com', password: 'password')
        sign_in(user)

        expect {
          post :create, params: { food: { name: '', price: 300 } }
        }.not_to change(user.foods, :count)

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the food item from the current user\'s list' do
      user = User.create(email: 'test@example.com', password: 'password')
      food = user.foods.create(name: 'Food', price: 100)
      sign_in(user)

      expect {
        delete :destroy, params: { id: food.id }
      }.to change(user.foods, :count).by(-1)

      expect(response).to redirect_to(foods_path)
    end
  end
end
