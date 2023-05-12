require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
    describe "GET #index" do
      it "returns http success" do
        user = User.create(email: "user@example.com", password: "password")
        sign_in user
        
        get :index
        
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET #show" do
      it "returns http success" do
        user = User.create(email: "user@example.com", password: "password")
        sign_in user
        inventory = Inventory.create(name: "inventory", user: user)
  
        get :show, params: { id: inventory.id }
  
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET #new" do
      it "returns http success" do
        user = User.create(email: "user@example.com", password: "password")
        sign_in user
  
        get :new
  
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "POST #create" do
      context "with valid params" do
        it "creates a new inventory" do
          user = User.create(email: "user@example.com", password: "password")
          sign_in user
          
          expect {
            post :create, params: { inventory: { name: "inventory" } }
          }.to change(Inventory, :count).by(1)
        end
  
        it "redirects to the created inventory" do
          user = User.create(email: "user@example.com", password: "password")
          sign_in user
          
          post :create, params: { inventory: { name: "inventory" } }
  
          expect(response).to redirect_to(Inventory.last)
        end
      end
  
      context "with invalid params" do
        it "returns http success" do
          user = User.create(email: "user@example.com", password: "password")
          sign_in user
          
          post :create, params: { inventory: { name: "" } }
  
          expect(response).to have_http_status(:redirect)
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "destroys the requested inventory" do
        user = User.create(email: "user@example.com", password: "password")
        sign_in user
        inventory = Inventory.create(name: "inventory", user: user)
        
        expect {
          delete :destroy, params: { id: inventory.id }
        }.to change(Inventory, :count).by(-1)
      end
  
      it "redirects to the inventories list" do
        user = User.create(email: "user@example.com", password: "password")
        sign_in user
        inventory = Inventory.create(name: "inventory", user: user)
  
        delete :destroy, params: { id: inventory.id }
  
        expect(response).to redirect_to(inventories_url)
      end
    end
  end
  