class AddTagColorToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :tagColor, :String
  end
end
