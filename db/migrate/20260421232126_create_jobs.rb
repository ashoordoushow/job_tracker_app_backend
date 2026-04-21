class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :status
      t.string :location
      t.string :link
      t.date :date_applied
      t.text :notes

      t.timestamps
    end
  end
end
