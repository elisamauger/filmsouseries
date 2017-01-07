class AddCheckedToDocumentaire < ActiveRecord::Migration[5.0]
  def change
    add_column :documentaires, :checked, :boolean
  end
end
