class CreatePoems < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.string :author
      t.string :title
      t.string :line
    end
  end
end
