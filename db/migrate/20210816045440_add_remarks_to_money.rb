class AddRemarksToMoney < ActiveRecord::Migration[6.0]
  def change
    add_column :money, :remarks, :string, default: "add money"
  end
end
