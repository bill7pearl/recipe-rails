require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'test', email: 'test@mail.com', password: 'password')
    Recipe.create(name: 'Recipe', description: 'This is description', public: true, preparation: '1 hours',
                  cooking_time: 1, user: @user)
  end

  before(:each) { subject.save }

  it 'should have a name' do
    expect(subject.name).to eql('Recipe')
  end

  it 'should have a description' do
    expect(subject.description).to eql('This is description')
  end

  it 'Should always have preparation time' do
    expect(subject.preparation).to eql('1 hours')
  end

  it 'Should always have cooking time' do
    expect(subject.cooking_time).to eql(1)
  end

  it 'should have public set to true' do
    expect(subject.public).to eql(true)
  end
end