class CreateProgressBars < ActiveRecord::Migration
  def change
    create_table :progress_bars do |t|
      t.string :name

      t.timestamps
    end
  end
end
