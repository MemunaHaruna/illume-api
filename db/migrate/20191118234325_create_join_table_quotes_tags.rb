class CreateJoinTableQuotesTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quotes, :tags do |t|
      t.index [:quote_id, :tag_id], unique: true
      # t.index [:tag_id, :quote_id]
    end
  end
end
