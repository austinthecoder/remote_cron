class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :seconds
      t.string :http_method
      t.text :url
      t.text :body

      t.timestamps
    end
  end
end
