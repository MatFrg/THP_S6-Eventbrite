class ChangeEvent < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :events, :user, index: true
  	add_reference :events, :admin, index: true
  end
end
