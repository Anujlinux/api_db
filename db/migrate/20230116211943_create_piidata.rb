class CreatePiidata < ActiveRecord::Migration[6.1]
  def change
    create_table :piidata do |t|
      t.text :schema_name
      t.text :table_name
      t.text :column_name
      t.text :pii_type
      t.integer :amount
      t.integer :tenant_id

      t.timestamps
    end
  end
end
