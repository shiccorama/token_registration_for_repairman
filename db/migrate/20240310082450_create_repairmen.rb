class CreateRepairmen < ActiveRecord::Migration[7.1]
  def change
    create_table :repairmen do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :location
      t.string :password
      t.string :password_confirmation
      t.boolean :terms

      t.timestamps
    end
  end
end
