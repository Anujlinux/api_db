class AddIntervalToSrctype < ActiveRecord::Migration[6.1]
  def change
    add_column :srctypes, :interval, :time
  end
end
