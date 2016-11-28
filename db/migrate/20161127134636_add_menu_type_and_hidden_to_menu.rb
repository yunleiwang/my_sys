class AddMenuTypeAndHiddenToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :menu_type, :integer
    add_column :menus, :hidden, :integer
  end
end
