class AddEnvironmentChangeToObserve < ActiveRecord::Migration
  def change
    add_column :observes, :environment_change, :string
  end
end
