class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :panel
      t.date :closing
      t.string :status

      t.timestamps
    end
  end
end
