class CreateAtoms < ActiveRecord::Migration[5.2]
  def change
    create_table :atoms do |t|
      t.integer :state, default: 0
      t.string :atype
      t.string :title
      t.integer :time
      t.integer :point
      t.integer :difficulty
      t.integer :description

      t.timestamps
    end
  end
end
