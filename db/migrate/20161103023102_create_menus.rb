class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name_cn
      t.string :name_en
      t.integer :menu_id
      t.string :link
      t.integer :seq
      t.integer :seq
      t.string :icon_class
      t.string :belong_to

      t.timestamps null: false
    end
  end
end
