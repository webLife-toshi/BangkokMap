class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|

      t.timestamps
    end
    add_column :administrators, :admin_name, :string
    add_column :administrators, :admin_email, :string
    add_column :administrators, :admin_password_hash, :string
    add_column :administrators, :admin_password_salt, :string
    add_column :administrators, :admin_remember_token, :string
    add_index  :administrators, :admin_remember_token
  end
end
