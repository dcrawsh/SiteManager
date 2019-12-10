class CreateEmploytrains < ActiveRecord::Migration[6.0]
  def change
    create_table :employtrains do |t|
      t.date :date 
      t.integer :employee_id 
      t.integer :training_id
    end

  end
end
