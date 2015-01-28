class ChangeTweets < ActiveRecord::Migration
  def change
    drop_table :battles
    drop_table :tweets

    create_table :battles do |t|
      t.string :brand1
      t.string :brand2

      t.timestamps
    end

    create_table :tweets do |t|
      t.references :battle, index: true
      t.string :owner
      t.string :brand
      t.string :message

      t.timestamps
    end
  end
end
