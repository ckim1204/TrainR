class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts, id: false do |t|
      t.integer :workout_id
      t.integer :exerciseorder
      t.belongs_to :exercise
      t.timestamps
    end
    execute "alter table workouts add primary key(workout_id, exerciseorder)"
  end
end
