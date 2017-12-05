class ChangeColumnLongitud < ActiveRecord::Migration[5.1]
  def change
    change_column :targets, :longitud, 'float USING CAST(longitud AS float)'
  end
end
