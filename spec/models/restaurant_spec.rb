describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'is not valid with a name of fewer than three characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "City Wok", user: User.create)
    restaurant = Restaurant.new(name: "City Wok")
    expect(restaurant).to have(1).error_on(:name)
  end

  context "#average_rating" do
    it "returns 'N/A' when there are no reviews" do
      restaurant = Restaurant.create(name: 'The Ivy', user: User.create)
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  context "1 review" do
    it "returns that rating" do
      restaurant = Restaurant.create(name: 'The Ivy', user: User.create)
      restaurant.reviews.create(rating: 4)
      expect(restaurant.average_rating).to eq 4
    end
  end
end
