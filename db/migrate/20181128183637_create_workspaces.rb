class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.boolean :smoke_free
      t.float :avg_rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
