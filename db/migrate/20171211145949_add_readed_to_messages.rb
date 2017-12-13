class AddReadedToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :readed, :boolean
  end
end
