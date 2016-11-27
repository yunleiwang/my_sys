class RenameCrfIdToSection < ActiveRecord::Migration
  def change
    rename_column :sections, :crf_id, :crf_info_id
  end
end
