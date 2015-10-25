class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.string :act
      t.integer :how_many
      t.date :deadline

      t.timestamps null: false
    end
  end
end
