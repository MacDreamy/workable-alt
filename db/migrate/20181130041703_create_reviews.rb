class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :detail
      t.integer :rating

      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
