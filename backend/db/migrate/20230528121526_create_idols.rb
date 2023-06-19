class CreateIdols < ActiveRecord::Migration[6.0]
  def change
    create_table :idols do |t|
      t.string :name
      t.string :image
      t.string :detail

      t.timestamps
    end
  end
end
