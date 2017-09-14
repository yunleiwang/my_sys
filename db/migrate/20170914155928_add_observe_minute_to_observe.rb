class AddObserveMinuteToObserve < ActiveRecord::Migration
  def change
    add_column :observes, :observe_minute, :integer
    add_column :observes, :other_drug, :string
  end
end
