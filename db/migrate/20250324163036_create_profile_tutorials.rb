class CreateProfileTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_tutorials do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :tutorial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
