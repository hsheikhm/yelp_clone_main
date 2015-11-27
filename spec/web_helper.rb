def signin(email = 'test@example.com')
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: 'password')
  click_button('Log in')
end

def signup(email = 'test@example.com')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button('Sign up')
end

def add_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def signup_add_restaurant_and_signout
  signup
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
  click_link('Sign out')
end

def review(thoughts = "so so", rating = 3)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in "Thoughts", with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
