require 'rails_helper'

describe 'message', :js, :feature do
  let!(:first_user) { FactoryGirl.create :user }
  let!(:second_user) { FactoryGirl.create :user }
  let!(:first_topic) { FactoryGirl.create :topic, id: 1 }
  let!(:second_topic) { FactoryGirl.create :topic, id: 2 }
  let!(:first_chat) do
    FactoryGirl.create :chat,
                       receiver: first_user,
                       sender: second_user,
                       topic: first_topic
  end
  let!(:second_chat) do
    FactoryGirl.create :chat,
                       receiver: first_user,
                       sender: second_user,
                       topic: second_topic
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
        find('#chat-receiver-'+first_chat.id.to_s).click
        fill_in 'message_body', with: 'Hello'
        find('#message_body').native.send_keys(:return)
        fill_in 'message_body', with: 'How are you?'
        find('#message_body').native.send_keys(:return)
      end
    end

    it 'receives the unread message notification' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('#chat-'+first_chat.id.to_s, text: '2')
      end
    end

    it 'receives the global unread message notification' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('#chat-receiver-'+second_chat.id.to_s)
        find('#chat-receiver-'+second_chat.id.to_s).click
        expect(page).to have_css('.unread-msg-div-chat', text: '2')
      end
    end

    it 'receives the message' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('#chat-receiver-'+first_chat.id.to_s)
        find('#chat-receiver-'+first_chat.id.to_s).click
        expect(page).to have_css('div.message-content', text: 'Hello')
        expect(page).to have_css('div.message-content', text: 'How are you?')
      end
    end
  end
end
