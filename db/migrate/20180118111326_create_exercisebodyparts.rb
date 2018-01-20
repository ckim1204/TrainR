class CreateExercisebodyparts < ActiveRecord::Migration[5.1]
  def change
    create_table :exercisebodyparts do |t|
      t.belongs_to :exercise
      t.belongs_to :bodypart
      t.timestamps
    end
  end
end
