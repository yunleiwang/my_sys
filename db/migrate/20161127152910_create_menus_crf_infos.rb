class CreateMenusCrfInfos < ActiveRecord::Migration
  def change
    create_table :menus_crf_infos do |t|
      t.integer :menu_id
      t.integer :crf_info_id

      t.timestamps null: false
    end
  end
end
