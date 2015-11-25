describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'is not valid with a name of fewer than three characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "City Wok")
    restaurant = Restaurant.new(name: "City Wok")
    expect(restaurant).to have(1).error_on(:name)
  end

end
