class AddAssetsToSmallStories < ActiveRecord::Migration[5.2]
  def change
    add_column :small_stories, :images, :string
    add_column :small_stories, :videos, :string
  end
end
