require 'rails_helper'

describe 'user', :js do
  let(:user) { FactoryGirl.create :user }
  let(:topic) { FactoryGirl.create :topic }
  let!(:target) { FactoryGirl.create :target, user: user }

  it 'sign in' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'SIGN IN'
    expect(page).to have_content('Signed in successfully')
  end

  it 'sign out' do
    login_as(user, scope: :user)
    visit root_path
    find('.logout-link').click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
