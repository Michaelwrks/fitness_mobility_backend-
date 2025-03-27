class RemoveProfileIdFromTutorials < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutorials, :profile_id, :integer
  end
end
