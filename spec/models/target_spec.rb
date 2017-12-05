require 'rails_helper'

RSpec.describe Target, type: :model do
  describe '#validations' do
    let(:user) { FactoryGirl.create :user }
    let(:topic) { FactoryGirl.create :topic }
    let(:target) { FactoryGirl.create :target }

    it 'is not valid without a title' do
      target.title = nil
      expect(target).to_not be_valid
    end

    it 'is not valid without an area' do
      target.area = nil
      expect(target).to_not be_valid
    end

    it 'raise an error if more that 10 targets are saved' do
      expect { FactoryGirl.create_list(:target, 11, user: user) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'not raise an error if less than ten targets are saved' do
      expect { FactoryGirl.create_list(:target, 10, user: user) }
        .to_not raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#search_for_compatible_targets' do
    let!(:first_user) { FactoryGirl.create :user }
    let!(:second_user) { FactoryGirl.create :user }
    let!(:topic) { FactoryGirl.create :topic }
    let(:expected_params) do
      { receiver_id: first_user.id, sender_id: second_user.id, topic_id: topic.id }
    end

    context 'when targets intersects' do
      let!(:first_target) { FactoryGirl.create :target, topic: topic, user: first_user }
      let!(:second_target) { FactoryGirl.create :target, topic: topic, user: second_user }
      it 'create new chat' do
        expect(Chat.where(expected_params)).to exist
      end
    end
    context 'when targets does not intersects' do
      let!(:first_target) { FactoryGirl.create :target, topic: topic, user: first_user }
      let!(:third_target) do
        FactoryGirl.create :target,
                           topic: topic,
                           user: second_user,
                           latitud: -34.90895056115476,
                           longitud: -56.21159076690674
      end
      it 'not create new chat' do
        expect(Chat.where(expected_params)).not_to exist
      end
    end
  end
end
