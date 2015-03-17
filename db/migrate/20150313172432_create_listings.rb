class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.integer :project_id
    	t.integer :user_id
    	t.integer :skill_id
    	
      t.timestamps null: false
    end
  end
end
