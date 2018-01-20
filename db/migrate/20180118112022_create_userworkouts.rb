class CreateUserworkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :userworkouts do |t|
      t.string :repeats
      t.string :weights
      t.string :rests
      t.belongs_to :user
      t.belongs_to :workout
      t.belongs_to :exercise
      t.timestamps
    end
  end
end
