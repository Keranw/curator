class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :utype
      t.string :username
      t.string :email
      t.string :password
      t.string :department
      t.integer :course_list, default: [], array: true
      t.integer :follow_course_list, default: [], array: true
      t.integer :atom_list, default: [], array: true
      t.string :reset_token

      t.timestamps
    end
  end
end
