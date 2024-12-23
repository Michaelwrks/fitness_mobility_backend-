class CreateTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :category
      t.string :format

      t.timestamps
    end
  end
end
