class AddIsCurrentToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :is_current, :boolean, default: false
  end
end
