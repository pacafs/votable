class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.float :amount

      t.timestamps
    end
  end
end
