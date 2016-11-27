class CreatePublicLibs < ActiveRecord::Migration
  def change
    create_table :public_libs do |t|
      t.string :table_name
      t.string :item_name
      t.string :item_text
      t.string :item_value
      t.string :pinyin

      t.timestamps null: false
    end
  end
end
