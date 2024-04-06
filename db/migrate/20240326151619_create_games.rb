class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.text :body
      t.string :game_image_id

      t.timestamps
    end
  end
end
