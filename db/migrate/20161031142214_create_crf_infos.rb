class CreateCrfInfos < ActiveRecord::Migration
  def change
    create_table :crf_infos do |t|
      t.string :name
      t.string :description
      t.integer :seq
      t.integer :crf_type
      t.integer :follow

      t.timestamps null: false
    end
  end
end
