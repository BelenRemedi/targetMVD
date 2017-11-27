class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :receiver
      t.references :sender

      t.timestamps
    end
  end
end
