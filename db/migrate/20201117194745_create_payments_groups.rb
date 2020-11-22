class CreatePaymentsGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :payments_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
