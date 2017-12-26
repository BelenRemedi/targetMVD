require 'rails_helper'

describe 'edit_profile', :js do
  let(:user) { FactoryGirl.create :user }

  before(:each) do
    sign_in(user)
    click_link('edit-link')
  end

  context 'when data is incorrect' do
    it 'raise error messages' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[current_password]', with: user.password
      fill_in 'user[password]', with: '1234567'
      fill_in 'user[password_confirmation]', with: '12345678'
      click_button 'SAVE CHANGES'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  context 'when data is correct' do
    it 'updates user information' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[current_password]', with: user.password
      fill_in 'user[password]', with: '1234567'
      fill_in 'user[password_confirmation]', with: '1234567'
      click_button 'SAVE CHANGES'
      find('.logout-link').click
      sign_in_with_params(user.email, '1234567')
    end
  end
end
