class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.string :note_type, null: false
      t.datetime :due_date, null: false
      t.timestamps
    end
  end
end
