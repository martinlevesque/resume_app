class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.date :period_begin
      t.date :period_end
      t.string :company
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
