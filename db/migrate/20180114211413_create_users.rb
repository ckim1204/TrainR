class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :sex
      t.date :birthdate
      t.integer :height
      t.integer :weight
      t.belongs_to :usertype, index: true
      t.timestamps
    end
  end
end
