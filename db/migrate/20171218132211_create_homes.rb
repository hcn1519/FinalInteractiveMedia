class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :content
      t.integer :tag
      t.datetime :writeDate

      t.timestamps null: false
    end
  end
end
