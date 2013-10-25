class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps
    end
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
    add_column :users, :birthday, :date
    add_column :users, :user_remember_token, :string

    add_index  :users, :user_remember_token
  end
end
