class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
