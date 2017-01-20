class AddUrlToGitte < ActiveRecord::Migration[5.0]
  def change
    add_column :gittes, :url, :string
  end
end
