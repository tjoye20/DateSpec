class CreateAdmirers < ActiveRecord::Migration[5.0]
  def change
    create_table :admirers do |t|
      t.integer :user_id, null: false
      t.integer :admirer_id, null: false
      t.text :q1_response, null: false
      t.text :q2_response, null: false
      t.text :q3_response, null: false
      t.boolean :user_approved, default: true

      t.timestamps(null: false)
    end
  end
end
