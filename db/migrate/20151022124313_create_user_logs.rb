class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.string :act
      t.integer :act_id
      t.string :status
      t.string :log_data

      t.timestamps null: false
    end
  end
end
