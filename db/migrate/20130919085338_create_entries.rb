class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|

      t.timestamps
    end
    add_reference :entries, :user, index: true, null: false
    add_column    :entries, :title, :string, null: false
    add_column    :entries, :content, :text
    add_column    :entries, :status, :string, null: false, default: "draft"
    add_index     :entries, :title
  end
end
