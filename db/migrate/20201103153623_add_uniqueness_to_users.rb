class AddUniquenessToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:uid, :provider], unique: true
  end
end
