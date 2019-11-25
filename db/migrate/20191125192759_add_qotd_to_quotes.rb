class AddQotdToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :is_qotd, :boolean, null: false, default: false
  end
end
