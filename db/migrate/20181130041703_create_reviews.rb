class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :detail
      t.int :rating

      t.references :workspace_id, foreign_key: true

      t.timestamps
    end
  end
end
