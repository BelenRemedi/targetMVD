require 'rails_helper'

describe 'message', :js, :feature do
  let!(:first_user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  let!(:topic) { FactoryGirl.create :topic, id: 1 }
  let!(:chat) do
    FactoryGirl.create :chat,
                       receiver: first_user,
                       sender: second_user,
                       topic: topic
  end

  after { Capybara.reset_sessions! }

  before(:each) do
    Capybara.using_session 'user1' do
      sign_in(first_user)
    end

    Capybara.using_session 'user2' do
      sign_in(second_user)
    end
  end

  context 'start chat conversation' do
    before(:each) do
      Capybara.using_session 'user1' do
        find('.chat-receiver').click
        fill_in 'message_body', with: 'hello'
        find('#message_body').native.send_keys(:return)
      end
    end

    it 'The message is received' do
      Capybara.using_session 'user2' do
        save_and_open_page
        expect(page).to have_css('.chat-receiver')
        find('.chat-receiver').click
        expect(page).to have_css('div.message-content', text: 'hello')
      end
    end
  end
end
