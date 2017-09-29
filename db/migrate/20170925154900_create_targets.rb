class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.string :title
      t.string :topic
      t.integer :area

      t.timestamps
    end
  end
end
