class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.integer :seq
      t.integer :parent_id
      t.integer :crf_id

      t.timestamps null: false
    end
  end
end
