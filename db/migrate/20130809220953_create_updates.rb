class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :myupdate
      t.string :link

      t.timestamps
    end
  end
end
