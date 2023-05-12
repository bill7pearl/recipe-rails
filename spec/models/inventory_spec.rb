require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password") }
  let(:inventory) { Inventory.new(user_id: user.id) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:inventory_foods).dependent(:destroy) }
  end

  describe "validations" do
    it "is valid with a user_id" do
      expect(inventory).to be_valid
    end

    it "is invalid without a user_id" do
      inventory.user_id = nil
      expect(inventory).to_not be_valid
    end
  end
end
