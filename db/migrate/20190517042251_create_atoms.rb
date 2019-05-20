class CreateAtoms < ActiveRecord::Migration[5.2]
  def change
    create_table :atoms do |t|
      ###
      t.string :title
      t.string :author
      t.string :institution
      t.string :description
      t.string :topic1
      t.string :lo1
      t.string :topic2
      t.string :lo2
      t.string :tags#, default: [], array: true
      t.integer :difficulty
      t.integer :time
      t.string :item_parameter
      ###
      t.integer :state, default: 0
      t.integer :point
      t.string :atype
      ###
      t.string :source_course_id

      t.timestamps
    end
  end
end
