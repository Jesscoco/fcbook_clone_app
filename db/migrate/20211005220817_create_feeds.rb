class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.text :image
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
