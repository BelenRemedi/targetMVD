class RemoveReadedFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :readed, :boolean
  end
end
