class AddlatitudToTargets < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :latitud, :string
    add_column :targets, :longitud, :string
  end
end
