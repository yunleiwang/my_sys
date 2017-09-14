class AddSeqToMenusCrfInfo < ActiveRecord::Migration
  def change
    add_column :menus_crf_infos, :seq, :integer
  end
end
