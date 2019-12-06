class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :firstname 
      t.string :lastname 
      t.string :workdayid
      t.integer :site_id
      end
  end
end

