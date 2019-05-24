class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.integer :status
      t.references :user

      t.timestamps
    end
  end
end

