class RemoveColumnFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :icon
  end
end
