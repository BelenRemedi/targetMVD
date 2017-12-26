module SessionHelper
  def sign_in(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'SIGN IN'
    expect(page).to have_content('Signed in successfully')
  end

  def sign_in_with_params(email, password)
    visit root_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'SIGN IN'
    expect(page).to have_content('Signed in successfully')
  end
end

RSpec.configure do |config|
  config.include SessionHelper, type: :feature
end
