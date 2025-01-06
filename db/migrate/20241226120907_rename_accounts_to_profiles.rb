class RenameAccountsToProfiles < ActiveRecord::Migration[6.1]
  def change
    rename_table :accounts, :profiles
  end
end
