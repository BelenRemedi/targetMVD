class AddTopicToTargets < ActiveRecord::Migration[5.1]
  def change
    add_reference :targets, :topic, foreign_key: true
  end
end
