class AddTimesToUserworkouts < ActiveRecord::Migration[5.1]
  def change
	add_column :userworkouts, :times, :string
  end
end
