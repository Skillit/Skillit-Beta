class AddIdsToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :user_id, :int
    add_column :talents, :skill_id, :int
  end
end
