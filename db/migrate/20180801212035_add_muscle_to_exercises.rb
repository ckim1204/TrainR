class AddMuscleToExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :exercises, :muscle, foreign_key: true
  end
end
