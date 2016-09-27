class AddColumnsToAdmirersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :admirers, :q1, :text
    add_column :admirers, :q2, :text
    add_column :admirers, :q3, :text
  end
end
