class CrateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |t|

      t.string :name
      t.string :age

      t.timestamps

    end
  end
end