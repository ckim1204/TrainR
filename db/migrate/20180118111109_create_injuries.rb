class CreateInjuries < ActiveRecord::Migration[5.1]
  def change
    create_table :injuries do |t|
      t.belongs_to :user
      t.belongs_to :bodypart
      t.timestamps
    end
  end
end
