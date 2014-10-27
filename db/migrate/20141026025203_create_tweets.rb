class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :battle, index: true
      t.text :owner
      t.text :brand
      t.text :message

      t.timestamps
    end
  end
end
