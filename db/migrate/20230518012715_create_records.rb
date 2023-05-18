class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.belongs_to :user
      t.belongs_to :ranking
      t.decimal :km_traveled

      t.timestamps
    end
  end
end
