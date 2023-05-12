require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password") }
  let(:food) { Food.create(name: "Pizza", measurement_unit: "gram", price: 1.5) }
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
    it { should have_many(:recipes).through(:recipe_foods).source(:recipe) }
    it { should have_many(:inventory_foods) }
  end
  
  describe 'attributes' do
    it { should respond_to(:measurement_unit) }
    it { should respond_to(:price) }
  end
  
  describe 'validations' do
    it 'validates presence of name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end
    
    it 'validates length of name' do
      food = Food.new(name: 'a'*51)
      expect(food).to_not be_valid
    end
  end
  
  describe 'instance methods' do
    describe '#measurement_unit' do
      it 'should return the measurement unit' do
        expect(food.measurement_unit).to eq("gram")
      end
    end
  
    describe '#price' do
      it 'should return the price' do
        expect(food.price).to eq(1.5)
      end
    end
  end
end
