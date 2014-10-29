class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    	t.string "title"
    	t.text "description"
    	t.string "email",:default => " ",:null =>false
    	t.string "category"
    	t.string "when"
    	t.string "where"
    	t.time "time"
    	#falta photp id

      t.timestamps
    end
    add_index("events","email")
  end
end
