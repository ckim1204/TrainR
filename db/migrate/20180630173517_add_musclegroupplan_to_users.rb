class AddMusclegroupplanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :musclegroup_plan, :string
  end
end
