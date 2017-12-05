class ChangeColumnLatitud < ActiveRecord::Migration[5.1]
  def change
    change_column :targets, :latitud, 'float USING CAST(latitud AS float)'
  end
end
