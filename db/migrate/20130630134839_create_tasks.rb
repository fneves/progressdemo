class CreateTasks < ActiveRecord::Migration
  def change

    create_table :tasks do |t|
      t.string :title
      t.date :duedate
      t.text :body
      t.string :status

      t.belongs_to :progress_bar

      t.timestamps
    end
  end
end
