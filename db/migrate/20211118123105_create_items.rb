class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
