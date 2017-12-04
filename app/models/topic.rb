class Topic < ApplicationRecord
  has_many :targets
  has_many :chats
end
