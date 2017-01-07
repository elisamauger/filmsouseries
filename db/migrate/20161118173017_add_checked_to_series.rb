class AddCheckedToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :checked, :boolean
  end
end
