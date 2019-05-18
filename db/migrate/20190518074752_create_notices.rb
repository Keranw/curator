class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :aid
      t.integer :cid
      t.integer :uid
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
