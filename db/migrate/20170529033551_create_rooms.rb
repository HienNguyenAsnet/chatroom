class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :desc
      t.references :user
      t.string :channel

      t.timestamps
    end
  end
end
