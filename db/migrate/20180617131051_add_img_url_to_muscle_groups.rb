class AddImgUrlToMuscleGroups < ActiveRecord::Migration[5.1]
  def change
	add_column :musclegroups, :imgURL, :string
  end
end
