require 'rails_helper'

RSpec.describe TargetsController, type: :controller do
  describe 'DELETE destroy' do
    let(:user) { FactoryGirl.create :user }
    let!(:target) { FactoryGirl.create :target }

    context 'when user is logged in' do
      before(:each) do
        sign_in(user, scope: :user)
      end
      it 'deletes the target' do
        expect do
          delete :destroy, params: { id: target.id }, format: 'js'
        end.to change(Target, :count).by(-1)
      end
    end
    context 'when user is logged out' do
      it 'returns unauthorize status 401' do
        delete :destroy, params: { id: target.id }, format: 'js'
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST create' do
    let(:user) { FactoryGirl.create :user }
    let(:topic) { FactoryGirl.create :topic }
    let(:targets_params) { FactoryGirl.attributes_for(:target) }
    before { allow(controller).to receive(:current_user) { user } }

    context 'when user is logged in' do
      before(:each) do
        sign_in(user, scope: :user)
      end
      it 'creates a new target' do
        expect do
          post :create,
               params: { target: targets_params.merge(topic_id: topic.id, user_id: user.id) },
               format: 'js'
        end.to change(Target, :count).by(1)
      end
    end
    context 'when user is logged out' do
      it 'returns unauthorize status 401' do
        post :create,
             params: { target: targets_params.merge(topic_id: topic.id, user_id: user.id) },
             format: 'js'
        expect(response).to have_http_status(401)
      end
    end
  end
end
