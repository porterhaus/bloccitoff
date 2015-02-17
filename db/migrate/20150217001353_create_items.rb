class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.boolean :completed
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :users
  end
end
