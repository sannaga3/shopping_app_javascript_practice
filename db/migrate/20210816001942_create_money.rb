class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.integer :yen, null: false, default: 0
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
