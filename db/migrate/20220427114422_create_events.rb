class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :title
      t.text :location
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
