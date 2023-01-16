class CreateApis < ActiveRecord::Migration[6.1]
  def change
    create_table :apis do |t|
      t.string :name
      t.text :api_endpoint
      t.text :api_keys

      t.timestamps
    end
  end
end
