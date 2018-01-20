class CreateMuscleexercises < ActiveRecord::Migration[5.1]
  def change
    create_table :muscleexercises do |t|
      t.belongs_to :muscle
      t.belongs_to :exercise
      t.timestamps
    end
  end
end
