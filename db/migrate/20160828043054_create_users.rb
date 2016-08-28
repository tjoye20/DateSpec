class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.boolean :active, default: true, null: false
      t.string :password_hash
      t.string :gender, null: false
      t.string :gender_seeking, null: false
      t.text   :bio, null: false
      t.text   :question_1, null: false
      t.text   :question_2, null: false
      t.text   :question_3, null: false

      t.timestamps
    end
  end
end
