class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :mobility_level
      t.string :goals

      t.timestamps
    end
  end
end
