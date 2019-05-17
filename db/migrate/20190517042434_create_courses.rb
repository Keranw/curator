class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_id
      t.string :department
      t.string :curator
      t.string :atoms, default:[], array:true
      
      t.timestamps
    end
  end
end
