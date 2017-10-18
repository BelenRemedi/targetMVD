require 'rails_helper'

RSpec.describe Target, type: :model do

  describe  "#load_or_create" do
    let(:user) { FactoryGirl.create :user }
    let (:topic) { FactoryGirl.create :topic }
    let (:target) { FactoryGirl.create :target }


    it "is not valid without a title" do
      target.title = nil
      expect(target).to_not be_valid
    end

    it "is not valid without an area" do
      target.area = nil
      expect(target).to_not be_valid
    end

    it "is not valid more than ten targets" do
      expect{ FactoryGirl.create_list(:target, 11, user: user) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "is valid less than ten targets" do
      expect{ FactoryGirl.create_list(:target, 10, user: user) }.to_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
