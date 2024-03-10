class ReplaceAgeWithEmailInRepairmen < ActiveRecord::Migration[7.1]
  def change
    add_column :repairmen, :email, :string
    remove_column :repairmen, :age
  end
end
