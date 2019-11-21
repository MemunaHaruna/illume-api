class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false, default: ""
      t.string :author
      t.integer :source_type
      t.string :source_title
      t.string :link_to_source
      t.integer :access, null: false, default: 0

      t.timestamps
    end
  end
end
