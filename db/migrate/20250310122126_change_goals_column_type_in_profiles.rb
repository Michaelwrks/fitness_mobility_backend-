class ChangeGoalsColumnTypeInProfiles < ActiveRecord::Migration[6.1]
  def change
    change_column :profiles, :goals, :text
  end
end
