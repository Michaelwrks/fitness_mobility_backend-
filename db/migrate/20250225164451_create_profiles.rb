class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :mobility_level
      t.string :goals
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
