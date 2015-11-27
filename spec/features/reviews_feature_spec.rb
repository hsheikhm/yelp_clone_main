feature 'reviewing' do
  before {Restaurant.create name: 'KFC', user: User.create}

  scenario 'allows users to leave a review using a form' do
    signup
    review
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'user can not leave more than one review per restaurant' do
    signup
    review
    expect(page).not_to have_link 'Review KFC'
  end

  scenario 'displays an average rating for all reviews' do
    signup
    add_restaurant
    review
    click_link 'Sign out'
    signup("test7@testing.com")
    review("Great", 5)
    expect(page).to have_content 'Average rating: ★★★★☆'
  end
end
