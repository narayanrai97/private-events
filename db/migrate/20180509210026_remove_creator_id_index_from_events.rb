class RemoveCreatorIdIndexFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_index :events, column: :creator_id
  end
end
