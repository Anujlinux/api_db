class CreateSrctypes < ActiveRecord::Migration[6.1]
  def change
    create_table :srctypes do |t|
      t.text :name

      t.timestamps
    end
  end
end
