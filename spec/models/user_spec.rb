require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many :restaurants }
  it { is_expected.to have_many :reviews }
  it { is_expected.to have_many :reviewed_restaurants }

  context '#has_not_reviewed' do

    it "returns 'true' if a restaurant has not been reviewed by user" do
      user = User.create()
      restaurant = Restaurant.create(name: 'KFC', user: user)
      expect(user.has_not_reviewed(restaurant)).to eq true
    end

    it "returns 'false' if a restaurant has already been reviewed by user" do
      user = User.create(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
      restaurant = Restaurant.create(name: 'KFC', user: user)
      restaurant.reviews.create(thoughts: 'so so', rating: 5, user: user)
      expect(user.has_not_reviewed(restaurant)).to eq false
    end
  end

  context '#authored' do
    it "returns 'true' if #current_user is the same as the review's user" do
      user = User.create(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
      restaurant = Restaurant.create(name: 'KFC', user: user)
      review = restaurant.reviews.create(thoughts: 'so so', rating: 5, user: user)
      expect(user.authored(review)).to eq true
    end

    it "returns 'false' if #current_user isn't the same as the review's user" do
      user = User.create(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
      user2 = User.create(:email => 'test5@example.com', :password => 'password', :password_confirmation => 'password')
      restaurant = Restaurant.create(name: 'KFC', user: user)
      review = restaurant.reviews.create(thoughts: 'so so', rating: 5, user: user)
      expect(user2.authored(review)).to eq false
    end
  end
end
