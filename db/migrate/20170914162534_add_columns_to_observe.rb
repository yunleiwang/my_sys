class AddColumnsToObserve < ActiveRecord::Migration
  def change
    add_column :observes, :has_before_cause, :integer
    add_column :observes, :attack_show, :string
    add_column :observes, :duration, :string
    add_column :observes, :duration_time, :integer
  end
end
