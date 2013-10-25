class AddPostatToEntry < ActiveRecord::Migration
  def change
   add_column :entries, :posted_at, :datetime, null: false
  end
end
