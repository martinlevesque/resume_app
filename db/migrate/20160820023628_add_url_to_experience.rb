class AddUrlToExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :url, :string
  end
end
