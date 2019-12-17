class ChangeWorkdayidToBeIntegerInEmployees < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :workdayid, :integer
  end
end
