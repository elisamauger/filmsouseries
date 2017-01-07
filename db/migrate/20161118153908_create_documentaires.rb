class CreateDocumentaires < ActiveRecord::Migration[5.0]
  def change
    create_table :documentaires do |t|
      t.string :nom
      t.string :realisateur

      t.timestamps
    end
  end
end
