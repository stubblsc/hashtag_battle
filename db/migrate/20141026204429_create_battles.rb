class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.text :brand1
      t.text :brand2

      t.timestamps
    end
  end
end
