class RemoveTopicFromTargets < ActiveRecord::Migration[5.1]
  def change
    remove_column :targets, :topic, :string
  end
end
