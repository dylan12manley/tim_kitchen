class AddUsers < ActiveRecord::Migration[6.0]
  def change
    # drop_table :users
    create_table :users do |t|
      t.column :email, :string
      t.column :admin, :boolean
      t.column :password_hash, :string
      t.column :password_salt, :string
    end
  end
end
