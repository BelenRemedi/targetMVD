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
        fill_in 'message_body', with: 'Hello'
        find('#message_body').native.send_keys(:return)
        fill_in 'message_body', with: 'How are you?'
        find('#message_body').native.send_keys(:return)
      end
    end

    it 'receives the unread message notification' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('#chat-'+chat.id.to_s, text: '2')
      end
    end

    it 'receives the message' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('.chat-receiver')
        find('.chat-receiver').click
        expect(page).to have_css('div.message-content', text: 'Hello')
        expect(page).to have_css('div.message-content', text: 'How are you?')
      end
    end
  end
end
