class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.date :date
      t.time :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
