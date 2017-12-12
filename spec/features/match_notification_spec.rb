require 'rails_helper'

describe 'match_notification', :js, :feature do
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

  context 'when a chat is created' do
    before(:each) do
      Capybara.using_session 'user1' do
        ActionCable.server.broadcast "notification_channel_user_#{second_user.id}",
                                     user: User.find(second_user.id).name
      end
    end

    it 'opens the modal' do
      Capybara.using_session 'user2' do
        expect(page).to have_css('#modal')
      end
    end

  end
end
