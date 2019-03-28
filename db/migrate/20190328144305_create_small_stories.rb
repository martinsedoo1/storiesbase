class CreateSmallStories < ActiveRecord::Migration[5.2]
  def change
    create_table :small_stories do |t|
      t.string :title
      t.text :description
      t.float :longitude
      t.float :latitude
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
