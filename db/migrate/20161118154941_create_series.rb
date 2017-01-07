class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :nom
      t.string :realisateur

      t.timestamps
    end
  end
end
