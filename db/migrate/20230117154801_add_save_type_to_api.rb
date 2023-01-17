class AddSaveTypeToApi < ActiveRecord::Migration[6.1]
  def change
    add_column :apis, :save_type, :string
  end
end
